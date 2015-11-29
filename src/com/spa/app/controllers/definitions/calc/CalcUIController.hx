package com.spa.app.controllers.definitions.calc;

import com.spa.app.controllers.definitions.DefinitionController;
import com.spa.app.engine.calculator.Calculator;
import haxe.ui.toolkit.containers.Grid;
import haxe.ui.toolkit.controls.Spacer;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.controls.TextInput;
import haxe.ui.toolkit.core.Component;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.hscript.ScriptInterp;
import learnmath.mathml.formula.MathML;
import learnmath.mathml.formula.Style;
import openfl.geom.Rectangle;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/calc/calc.xml"))
class CalcUIController extends DefinitionController {
	public function new() {
		
	}
	private var _calc:Calculator;
	public var calc(get, set):Calculator;
	private function get_calc():Calculator {
		return _calc;
	}
	private function set_calc(value:Calculator):Calculator {
		_calc = value;
		refreshUI();
		return value;
	}
	
	public override function refreshUI() {
		var inputCols:Int = calc.inputColumns;
		var inputGrid:Grid = new Grid();
		inputGrid.columns = inputCols * 2;
		inputGrid.percentWidth = 100;
		
		var n = 0;
		for (input in calc.sortedInputs) {
			var label:Text = new Text();
			if (input.label != null) {
				label.text = input.label;
			} else if (input.labelXML != null) {
				var ml:MathML = new MathML(input.labelXML);
				var s:Style = new Style();
				s.size = 11;
				s.font = "_sans";
				var rc:Rectangle = ml.drawFormula(label.sprite, s);
				label.autoSize = false;
				label.width = rc.width;
				label.height = rc.height;
			}
			inputGrid.addChild(label);			
			
			var inputField:TextInput = new TextInput();
			inputField.text = input.value;
			inputField.percentWidth = 100 / calc.inputColumns;
			inputField.id = input.id;
			inputField.addEventListener(UIEvent.CHANGE, onInputChanged);
			inputGrid.addChild(inputField);	
			n++;
		}

		var d = n % calc.inputColumns;
		if (d == 0) {
			d = inputCols;
		}
		for (x in 0...d) {
			var spacer:Spacer = new Spacer();
			inputGrid.addChild(spacer);
			
			var spacer:Spacer = new Spacer();
			spacer.height = 20;
			inputGrid.addChild(spacer);
		}
		
		for (result in calc.sortedResults) {
			var label:Text = new Text();
			if (result.label != null) {
				label.text = result.label;
			} else if (result.labelXML != null) {
				var ml:MathML = new MathML(result.labelXML);
				var s:Style = new Style();
				s.size = 11;
				s.font = "_sans";
				var rc:Rectangle = ml.drawFormula(label.sprite, s);
				label.autoSize = false;
				label.width = rc.width;
				label.height = rc.height;
			}
			inputGrid.addChild(label);			
			
			
			var resultField:Text = new Text();
			resultField.text = result.value;
			resultField.percentWidth = 100 / calc.inputColumns;
			resultField.clipContent = true;
			resultField.id = result.id;
			resultField.styleName = "calculatorResult";
			inputGrid.addChild(resultField);	
		}
		
		var scrollContent:Component = scrollview.findChild("scrollContent", null, true);
		if (scrollContent == null) {
			return;	
		}
		scrollContent.removeAllChildren();
		scrollContent.addChild(inputGrid);
		
		updateResults();
	}
	
	private function updateResults() {
		var scrollContent:Component = scrollview.findChild("scrollContent", null, true);
		
		for (result in calc.sortedResults) {
			var ready:Bool = true;
			var field:Text = scrollContent.findChild(result.id, null, true);
			
			for (v in result.variables) {
				if (calc.getValue(v) == null) {
					ready = false;
					break;
				}

				if (calc.getValue(v).length == 0) {
					ready = false;
					break;
				}
			}
			
			if (ready == false) {
				field.text = "---";
				continue;
			}
			
			try {
				var parser = new hscript.Parser();
				var program = parser.parseString(result.formula);
				var interp = new ScriptInterp();
				for (f in calc.allFields) {
					var v:String = f.value;
					if (Std.parseInt(v) != null) {
						if (v.indexOf(".") == -1) {
							interp.variables.set(f.id, Std.parseInt(v));
						} else {
							interp.variables.set(f.id, Std.parseFloat(v));
						}
					} else if (v == "true" || v == "false") {
						interp.variables.set(f.id, (v == "true"));
					} else {
						interp.variables.set(f.id, v);
					}
					
				}
				var r = interp.execute(program);
				result.value = "" + r;
				
				if (field != null) {
					field.text = "" + r;
				}
			} catch (e:Dynamic) {
				trace("ERROR! " + e);
			}
		}
	}
	
	private function onInputChanged(e:UIEvent):Void {
		calc.setValue(e.component.id, e.component.text);
		updateResults();
	}
}