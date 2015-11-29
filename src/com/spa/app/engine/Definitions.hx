package com.spa.app.engine;
import com.spa.app.engine.questions.Question;

enum DefintionType {
	QUESTION;
}

class Definitions {
	public var questions:Map<String, Question> = new Map<String, Question>();
	
	public function new() {
	}
	
	public function getDefinitionType(id:String):DefintionType {
		var t = null;
		if (questions.exists(id)) {
			t = DefintionType.QUESTION;
		}
		return t;
	}
	
	public static function parseType(type:String):DefintionType {
		switch (type) {
			case "question":
				return DefintionType.QUESTION;
		}
		return null;
	}
}