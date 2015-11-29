package com.spa.app.engine;
import com.spa.app.controllers.CalcController;
import com.spa.app.engine.custom.CustomUI;
import com.spa.app.engine.Definitions.DefintionType;
import com.spa.app.engine.Manifest.ManifestResourceEntry;
import com.spa.app.engine.questions.Question;
import com.spa.app.engine.questions.QuestionFactory;
import com.spa.app.resources.ResourceLoaderFactory;
import haxe.ui.toolkit.core.Component;
import haxe.ui.toolkit.core.Toolkit;

class Engine {
	public var controller:CalcController;
	public var manifest:Manifest;
	public var definitions:Definitions;
	
	private var _loadCallback:Int->Void;
	private var _loadQueue:Array<ManifestResourceEntry>;
	
	public var prevDefinitionIds:Array<String>;
	public var currentDefinitionId:String;
	public var nextDefinitionId:String;
	
	public function new() {
	}
	
	public function init(controller:CalcController, manifest:Manifest, callback:Int->Void) {
		this.controller = controller;
		this.manifest = manifest;
		_loadCallback = callback;
		
		definitions = new Definitions();
		
		loadResources();
	}
	
	/****************************************************************************************************
	** GENERAL
	****************************************************************************************************/
	public var quickMode(get, null):Bool;
	private function get_quickMode():Bool {
		return controller.quickmode.selected;
	}
	
	/****************************************************************************************************
	** QUESTIONS
	****************************************************************************************************/
	public function questionValueChanged(q:Question) {
		controller.updateNavigation();
		if (quickMode == true) {
			nextDef();
		}
	}
	
	/****************************************************************************************************
	** DEFINITIONS
	****************************************************************************************************/
	public function queueNextDefinition(id:String) {
		nextDefinitionId = id;
	}
	
	public function start() {
		prevDefinitionIds = new Array<String>();
		nextDefinitionId = null;
		var entryPoint:String = manifest.entryPoint;
		currentDefinitionId = entryPoint;
		controller.showDefinition(entryPoint);
	}
	
	public function prevDef() {
		if (prevDefinitionIds.length != 0) {
			currentDefinitionId = prevDefinitionIds.pop();
			nextDefinitionId = null;
			controller.showDefinition(currentDefinitionId);
		}
	}
	
	public function nextDef() {
		if (nextDefinitionId != null) {
			prevDefinitionIds.push(currentDefinitionId);
			currentDefinitionId = nextDefinitionId;
			nextDefinitionId = null;
			controller.showDefinition(currentDefinitionId);
		}
	}
	
	/****************************************************************************************************
	** LOADING
	****************************************************************************************************/
	private function loadResources() {
		_loadQueue = new Array<ManifestResourceEntry>();
		for (r in manifest.resources) {
			_loadQueue.push(r);
		}
		
		checkQueue();
	}
	
	private function checkQueue() {
		if (_loadQueue.length == 0) {
			_loadCallback(1);
		} else {
			var r:ManifestResourceEntry = _loadQueue.pop();
			loadResource(r);
		}
	}
	
	private function loadResource(r:ManifestResourceEntry) {
		switch (r.extension) {
			case "xml":
				ResourceLoaderFactory.get(r.type).getXML(r.id, function(xml:Xml) {
					if (xml != null) {
						processXMLResource(xml);
					}
					checkQueue();
				});
			default:
				checkQueue();
		}
	}
	
	private function processXMLResource(xml:Xml) {
		xml = xml.firstElement();
		
		if (xml.nodeName == "definitions") { // load defs
			for (el in xml.elements()) {
				var type:String = el.get("type");
				processXMLNode(el, type);
			}
		} else { // assume the whole thing is a def
			var type:String = xml.get("type");
			if (type == null) { // default to a UI
				type = "custom";
			}
			processXMLNode(xml, type);
		}
	}
	
	private function processXMLNode(xml:Xml, type:String) {
		switch (Definitions.parseType(type)) {
			case DefintionType.QUESTION:
				processXMLQuestion(xml);
			case DefintionType.CUSTOM:	
				processXMLCustom(xml);
		}
	}
	
	private function processXMLQuestion(xml:Xml) {
		var q:Question = QuestionFactory.get(Question.parseType(xml.get("value")), this);
		q.id = xml.nodeName;
		if (xml.firstChild() != null) {
			q.prompt = xml.firstChild().nodeValue;
		}
		
		for (attrName in xml.attributes()) {
			var attrValue = xml.get(attrName);
			switch (attrName) {
				case "type" | "value": // skip reserved attributes	
				case "default":
					q.defaultValue = attrValue;
					q.setValueNoTrigger(attrValue);
				default:
					q.properties.set(attrName, attrValue);
			}
		}
		
		definitions.questions.set(q.id, q);
	}
	
	private function processXMLCustom(xml:Xml) {
		var component:Component = Toolkit.processXml(xml);
		
		var custom:CustomUI = new CustomUI();
		custom.id = xml.nodeName;
		custom.ui = component;
		
		definitions.custom.set(custom.id, custom);
	}
}