package com.spa.app.controllers.definitions;

import com.spa.app.controllers.definitions.questions.BooleanAltQuestionController;
import com.spa.app.controllers.definitions.questions.BooleanQuestionController;
import com.spa.app.controllers.definitions.questions.QuestionController;
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
}