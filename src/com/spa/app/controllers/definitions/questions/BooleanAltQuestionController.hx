package com.spa.app.controllers.definitions.questions;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/questions/boolean_alt.xml"))
class BooleanAltQuestionController extends QuestionController {
	public function new() {
		questionYes.onChange = function(e) {
			updateValue();
		};
		questionNo.onChange = function(e) {
			updateValue();
		};
	}

	private function updateValue() {
		if (questionYes.selected == false && questionNo.selected == false) {
			return;
		}

		var value:String = (questionYes.selected == true) ? "yes" : "no";
		var defId:String = question.properties.get(value);
		engine.queueNextDefinition(defId);
		question.value = value;
	}
	
	private override function refreshUI() {
		super.refreshUI();
		questionText.text = question.prompt;
	}
	
	
	private override function refreshValueUI() {
		super.refreshValueUI();
		if (question.value != null) {
			switch (question.value) {
				case "yes":
					questionYes.selected = true;
				case "no":
					questionNo.selected = true;
			}
		}
		
		updateValue();
	}
}	