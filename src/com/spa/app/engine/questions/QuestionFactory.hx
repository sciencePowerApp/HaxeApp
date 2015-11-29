package com.spa.app.engine.questions;
import com.spa.app.engine.Engine;
import com.spa.app.engine.questions.Question.QuestionType;

class QuestionFactory {
	public static function get(type:QuestionType, engine:Engine):Question {
		var q:Question = null;
		switch (type) {
			case QuestionType.BOOLEAN:
				q = new BooleanQuestion(engine);
		}
		
		if (q == null) {
			trace("Question class not found for " + type);
		} else {
			q.type = type;
		}
		
		return q;
	}
}