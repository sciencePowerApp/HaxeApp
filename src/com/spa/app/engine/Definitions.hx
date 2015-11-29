package com.spa.app.engine;
import com.spa.app.engine.calculator.Calculator;
import com.spa.app.engine.custom.CustomUI;
import com.spa.app.engine.questions.Question;

enum DefintionType {
	QUESTION;
	CUSTOM;
	CALCULATOR;
}

class Definitions {
	public var questions:Map<String, Question> = new Map<String, Question>();
	public var custom:Map<String, CustomUI> = new Map<String, CustomUI>();
	public var calcs:Map<String, Calculator> = new Map<String, Calculator>();
	
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
		if (calcs.exists(id)) {
			t = DefintionType.CALCULATOR;
		}
		return t;
	}
	
	public static function parseType(type:String):DefintionType {
		switch (type) {
			case "question":
				return DefintionType.QUESTION;
			case "custom":
				return DefintionType.CUSTOM;
			case "calc" | "calculator":
				return DefintionType.CALCULATOR;
		}
		return null;
	}
}