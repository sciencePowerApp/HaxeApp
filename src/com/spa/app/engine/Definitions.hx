package com.spa.app.engine;
import com.spa.app.engine.custom.CustomUI;
import com.spa.app.engine.questions.Question;

enum DefintionType {
	QUESTION;
	CUSTOM;
}

class Definitions {
	public var questions:Map<String, Question> = new Map<String, Question>();
	public var custom:Map<String, CustomUI> = new Map<String, CustomUI>();
	
	public function new() {
	}
	
	public function getDefinitionType(id:String):DefintionType {
		var t = null;
		if (questions.exists(id)) {
			t = DefintionType.QUESTION;
		}
		if (custom.exists(id)) {
			t = DefintionType.CUSTOM;
		}
		return t;
	}
	
	public static function parseType(type:String):DefintionType {
		switch (type) {
			case "question":
				return DefintionType.QUESTION;
			case "custom":
				return DefintionType.CUSTOM;
		}
		return null;
	}
}