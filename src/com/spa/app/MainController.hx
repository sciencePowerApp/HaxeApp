package com.spa.app;

import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/main.xml"))
class MainController extends XMLController {
	public function new() {
		testButton.onClick = function(e:UIEvent) {
			testButton.text = "Thanks!";
		};
	}
}