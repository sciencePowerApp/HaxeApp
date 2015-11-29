package com.spa.app.engine.calculator;
import haxe.ui.toolkit.core.Component;

class Calculator {
	public var id:String;
	
	public var headerUI:Component;
	public var footerUI:Component;
	
	public var inputColumns:Int = 1;
	public var inputs:Map<String, CalculatorInput> = new Map<String, CalculatorInput>();
	
	public var resultColumns:Int = 1;
	public var results:Map<String, CalculatorResult> = new Map<String, CalculatorResult>();
	
	public function new() {
		
	}
	
	public var sortedInputs(get, null):Array<CalculatorInput>;
	private function get_sortedInputs():Array<CalculatorInput> {
		var array:Array<CalculatorInput> = new Array<CalculatorInput>();
		for (i in inputs) {
			array[i.order] = i;
		}
		return array;
	}
	
	public var sortedResults(get, null):Array<CalculatorResult>;
	private function get_sortedResults():Array<CalculatorResult> {
		var array:Array<CalculatorResult> = new Array<CalculatorResult>();
		for (i in results) {
			array[i.order] = i;
		}
		return array;
	}

	public var allFields(get, null):Array<CalculatorField>;
	private function get_allFields():Array<CalculatorField> {
		var array:Array<CalculatorField> = new Array<CalculatorField>();

		for (i in sortedInputs) {
			array.push(i);
		}

		for (i in sortedResults) {
			array.push(i);
		}
		
		return array;
	}
	
	public function getValue(id:String):String {
		if (inputs.exists(id)) {
			return inputs.get(id).value;
		}
		if (results.exists(id)) {
			return results.get(id).value;
		}
		return null;
	}
	
	public function setValue(id:String, value:String) {
		if (inputs.exists(id) == true) {
			inputs.get(id).value = value;
		}
		if (results.exists(id) == true) {
			results.get(id).value = value;
		}
	}
}

class CalculatorInput extends CalculatorField {
	public function new () {
		super();
	}
}

class CalculatorResult extends CalculatorField {
	public var variables:Array<String> = new Array<String>();
	public var formula:String;

	public function new () {
		super();
	}
}

class CalculatorField {
	public var id:String;
	public var label:String;
	public var labelXML:Xml;
	public var order:Int = 0;

	public var value:String;
	public var defaultValue:String;
	
	public function new () {
		
	}
}