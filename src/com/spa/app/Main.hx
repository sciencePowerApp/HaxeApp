package com.spa.app;

import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;

class Main {
	public static function main() {
		Toolkit.theme = new GradientTheme();
		Toolkit.init();
		Toolkit.addStyleSheet("css/main.css");
		Toolkit.open(function(root:Root) {
			root.addChild(new MainController().view);
		});
	}
}
