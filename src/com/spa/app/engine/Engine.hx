package com.spa.app.engine;
import com.spa.app.controllers.CalcController;
import com.spa.app.engine.calculator.Calculator;
import com.spa.app.engine.calculator.Calculator.CalculatorInput;
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
			case DefintionType.CALCULATOR:	
				processXMLCalculator(xml);
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
	
	private function processXMLCalculator(xml:Xml) {
		var calcXML:Xml = getNamedElement("calc", xml);
		if (calcXML == null) {
			return;
		}
		
		var calc:Calculator = new Calculator();
		calc.id = xml.nodeName;
		
		var headerXML:Xml = getNamedElement("header", calcXML);
		if (headerXML != null) {
			trace("has a header");
		}
		var footerXML:Xml = getNamedElement("footer", calcXML);
		if (footerXML != null) {
			trace("has a footer");
		}
		
		var inputsXML:Xml = getNamedElement("inputs", calcXML);
		if (inputsXML != null) {
			if (inputsXML.get("columns") != null) {
				calc.inputColumns = Std.parseInt(inputsXML.get("columns"));
			}
			
			var order:Int = 0;
			for (inputXML in inputsXML.elements()) {
				var input:CalculatorInput = new CalculatorInput();
				input.id = inputXML.nodeName;
				input.defaultValue = inputXML.get("default");
				if (input.defaultValue != null) {
					input.value = input.defaultValue;
				}
				
				var mathML:Xml = getNamedElement("mathml", inputXML);
				if (mathML != null) {
					input.labelXML = mathML;
				} else if (inputXML.firstChild() != null) {
					input.label = inputXML.firstChild().nodeValue;
				}
				
				input.order = order;
				calc.inputs.set(input.id, input);
				order++;
			}
		}
		
		var resultsXML:Xml = getNamedElement("results", calcXML);
		if (resultsXML != null) {
			if (resultsXML.get("columns") != null) {
				calc.inputColumns = Std.parseInt(resultsXML.get("columns"));
			}
			
			var order:Int = 0;
			for (resultXML in resultsXML.elements()) {
				var result:CalculatorResult = new CalculatorResult();
				result.id = resultXML.nodeName;
				result.defaultValue = resultXML.get("default");
				if (result.defaultValue != null) {
					result.value = result.defaultValue;
				}
				
				var mathML:Xml = getNamedElement("mathml", resultXML);
				if (mathML != null) {
					result.labelXML = mathML;
				} else if (resultXML.firstChild() != null) {
					result.label = resultXML.firstChild().nodeValue;
				}
				
				result.formula = resultXML.get("formula");
				var vars:String = resultXML.get("variables");
				if (vars != null) {
					result.variables = vars.split(",");
				}
				
				result.order = order;
				calc.results.set(result.id, result);
				order++;
			}
		}
		
		definitions.calcs.set(calc.id, calc);
	}
	
	private static function getNamedElement(name:String, xml:Xml):Xml {
		var it:Iterator<Xml> = xml.elementsNamed(name);
		if (it == null || it.hasNext() == false) {
			return null;
		}
		return it.next();
	}
}