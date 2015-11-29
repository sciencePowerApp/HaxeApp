package com.spa.app.engine.questions;
import com.spa.app.engine.Engine;
import haxe.Timer;

enum QuestionType {
	BOOLEAN;
}

class Question {
	public var id:String;
	public var type:QuestionType;
	public var prompt:String;
	public var defaultValue:String;
	
	public var properties:Map<String, String> = new Map<String, String>();
	
	public var engine:Engine;
	
	public function new(engine:Engine) {
		this.engine = engine;
	}

	private var _value:String;
	public var value(get, set):String;
	private function get_value():String {
		return _value;
	}
	private function set_value(value:String):String {
		if (value == _value) {
			return value;
		}

		_value = value;
		if (engine.quickMode == true) { // lets add a little delay before moving on so there is UI feedback
			Timer.delay(function() {
				engine.questionValueChanged(this);
			}, 50);
		} else {
			engine.questionValueChanged(this);
		}
		return value;
	}
	public function setValueNoTrigger(value:String) {
		_value = value;
	}
	
	public static function parseType(type:String):QuestionType {
		switch (type) {
			case "boolean":
				return QuestionType.BOOLEAN;
		}
		return null;
	}
}	
