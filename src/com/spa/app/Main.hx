package com.spa.app;

import com.spa.app.controllers.MainController;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.style.Style;
import haxe.ui.toolkit.style.StyleManager;
import haxe.ui.toolkit.themes.GradientTheme;
import openfl.Assets;

class Main {
	public static function main() {
		Toolkit.theme = new GradientTheme();
		Toolkit.init();
		Toolkit.addStyleSheet("css/main.css");
		
		var f = Assets.getFont("fonts/Roboto-Medium.ttf");

		StyleManager.instance.addStyle("Text, Button, TextInput", new Style( {
			fontSize: 14,
			fontName: f.fontName,
			fontEmbedded: true,
		} ));

		#if mobile
			Toolkit.addStyleSheet("css/mobile.css");
		#else
			Toolkit.addStyleSheet("css/desktop.css");
		#end
		
		Toolkit.setTransitionForClass(haxe.ui.toolkit.containers.Stack, "none");
		Toolkit.setTransitionForClass(haxe.ui.toolkit.controls.popups.Popup, "none");
		
		Toolkit.open(function(root:Root) {
			Views.root = root;
			Views.main();
		});
	}
}
