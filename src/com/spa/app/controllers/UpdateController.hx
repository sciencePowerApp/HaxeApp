package com.spa.app.controllers;

import com.spa.app.Views;
import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

@:build(haxe.ui.toolkit.core.Macros.buildController("assets/ui/update.xml"))
class UpdateController extends BaseController {
	public function new() {
		backButton.onClick = function(e) {
			Views.start();
		}
		
	}
}