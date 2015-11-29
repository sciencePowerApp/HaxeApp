package com.spa.app.controllers;

import com.spa.app.controllers.definitions.custom.CustomUIController;
import com.spa.app.controllers.definitions.DefinitionControllerFactory;
import com.spa.app.controllers.definitions.questions.QuestionController;
import com.spa.app.engine.custom.CustomUI;
import com.spa.app.engine.Definitions.DefintionType;
import com.spa.app.engine.Engine;
import com.spa.app.engine.Manifest;
import com.spa.app.engine.questions.Question;
import com.spa.app.resources.ResourceLoaderFactory;
import com.spa.app.Views;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/calc.xml"))
class CalcController extends BaseController {
	private var _engine:Engine;
	
	public function new() {
		backButton.onClick = function(e) {
			if (quickmode.selected = true) {
				prev();
			} else {
				Views.main();
			}
		}
		
		ResourceLoaderFactory.get(ResourceType.ASSET).getXML("examples/eg1/manifest.xml", function(xml:Xml) {
			var m:Manifest = new Manifest();
			m.fromXML(xml);
			_engine = new Engine();
			_engine.init(this, m, function(success:Int) {
				trace("Engine ready, success: " + success);
				if (success == 1) {
					_engine.start();
				}
			});
		});
		
		prevDefButton.onClick = function(e) {
			prev();
		}
		
		nextDefButton.onClick = function(e) {
			next();
		}
		
		quickmode.onChange = function(e) {
			updateNavigation();
		}
	}
	
	public function showDefinition(id:String) {
		var defType:DefintionType = _engine.definitions.getDefinitionType(id);
		if (defType == null) {
			throw "Unknown definition type for: " + id;
		}
		
		switch (defType) {
			case DefintionType.QUESTION:
				showQuestion(id);
			case DefintionType.CUSTOM:
				showCustom(id);
		}
		updateNavigation();
	}
	
	public function showQuestion(id:String) {
		var q:Question = _engine.definitions.questions.get(id);
		if (quickmode.selected == true) {
			q.value = null;
		}
		var controller:QuestionController = DefinitionControllerFactory.buildQuestionController(q, _engine);
		if (controller != null) {
			content.removeAllChildren();
			content.addChild(controller.view);
		}
	}

	public function showCustom(id:String) {
		var c:CustomUI = _engine.definitions.custom.get(id);
		var controller:CustomUIController = DefinitionControllerFactory.buildCustomUIController(c, _engine);
		if (controller != null) {
			content.removeAllChildren();
			content.addChild(controller.view);
		}
	}
	
	public function prev() {
		_engine.prevDef();
	}
	
	public function next() {
		_engine.nextDef();
	}
	
	public function updateNavigation() {
		if (quickmode.selected == true) {
			/*
			prevDefButton.visible = false;
			nextDefButton.visible = false;
			*/
			navigationButtons.visible = false;
			return;
		} else {
			navigationButtons.visible = true;
		}
		
		if (_engine.prevDefinitionIds.length != 0) {
			prevDefButton.visible = true;
		} else {
			prevDefButton.visible = false;
		}
		
		if (_engine.nextDefinitionId != null) {
			nextDefButton.visible = true;
		} else {
			nextDefButton.visible = false;
		}
	}
}