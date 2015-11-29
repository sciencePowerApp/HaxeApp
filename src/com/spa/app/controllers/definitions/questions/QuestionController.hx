package com.spa.app.controllers.definitions.questions;

import com.spa.app.controllers.definitions.DefinitionController;
import com.spa.app.engine.questions.Question;

class QuestionController extends DefinitionController {
	private var _question:Question;
	public var question(get, set):Question;
	private function get_question():Question {
		return _question;
	}
	private function set_question(value:Question):Question {
		_question = value;
		refreshUI();
		if (engine.quickMode == false) {
			refreshValueUI();
		}
		return value;
	}
	
	private function refreshUI() {
		
	}
	
	private function refreshValueUI() {
		
	}
}