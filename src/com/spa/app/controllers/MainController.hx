package com.spa.app.controllers;

import com.spa.app.Views;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/main.xml"))
class MainController extends BaseController {
	public function new() {
		menuButton.onClick = function(e) {
			Views.showMenu();
		};
		
		startButton.onClick = function(e) {
			//Views.start();
			Views.calc();
		};
	}
}