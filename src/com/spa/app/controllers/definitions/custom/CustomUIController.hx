package com.spa.app.controllers.definitions.custom;

import com.spa.app.controllers.definitions.DefinitionController;
import com.spa.app.engine.custom.CustomUI;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.core.Component;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/custom/custom.xml"))
class CustomUIController extends DefinitionController {
	public function new() {
		
	}
	
	private var _customUI:CustomUI;
	public var customUI(get, set):CustomUI;
	private function get_customUI():CustomUI {
		return _customUI;
	}
	private function set_customUI(value:CustomUI):CustomUI {
		_customUI = value;
		refreshUI();
		return value;
	}
	
	public override function refreshUI() {
		var scrollContent:Component = scrollview.findChild("scrollContent", null, true);
		if (scrollContent == null) {
			return;	
		}
		scrollContent.removeAllChildren();
		scrollContent.addChild(_customUI.ui.clone());
	}
}