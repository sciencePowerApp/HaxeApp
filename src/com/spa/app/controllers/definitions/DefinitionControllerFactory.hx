package com.spa.app.controllers.definitions;

import com.spa.app.controllers.definitions.calc.CalcUIController;
import com.spa.app.controllers.definitions.custom.CustomUIController;
import com.spa.app.controllers.definitions.questions.BooleanAltQuestionController;
import com.spa.app.controllers.definitions.questions.BooleanQuestionController;
import com.spa.app.controllers.definitions.questions.QuestionController;
import com.spa.app.engine.calculator.Calculator;
import com.spa.app.engine.custom.CustomUI;
import com.spa.app.engine.Engine;
import com.spa.app.engine.questions.Question;

class DefinitionControllerFactory {
	public function new() {
		
	}
	
	public static function buildQuestionController(q:Question, engine:Engine):QuestionController {
		var controller:QuestionController = null;
		switch (q.type) {
			case QuestionType.BOOLEAN:
				//controller = new BooleanQuestionController();
				controller = new BooleanAltQuestionController();
		}
		
		if (controller == null) {
			trace("Coult not find controller for question type: " + q.type);
		} else {
			controller.engine = engine;
			controller.question = q;
		}
		
		return controller;
	}
	
	public static function buildCustomUIController(c:CustomUI, engine:Engine):CustomUIController {
		var controller:CustomUIController = new CustomUIController();
		controller.engine = engine;
		controller.customUI = c;
		return controller;
	}
	
	public static function buildCalcUIController(c:Calculator, engine:Engine):CalcUIController {
		var controller:CalcUIController = new CalcUIController();
		controller.engine = engine;
		controller.calc = c;
		return controller;
		
	}
}