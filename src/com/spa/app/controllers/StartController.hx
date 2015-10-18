package com.spa.app.controllers;

import com.spa.app.Views;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/start.xml"))
class StartController extends BaseController {
	public function new() {
		backButton.onClick = function(e) {
			Views.main();
		}
		
		wizardButton.onClick = function(e) {
			Views.wizard();
		}
		
		updateButton.onClick = function(e) {
			Views.update();
		}
		
		listButton.onClick = function(e) {
			Views.list();
		}
		
		aboutButton.onClick = function(e) {
			Views.about();
		}
	}
}