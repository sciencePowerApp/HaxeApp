package com.spa.app;

import com.spa.app.controllers.AboutController;
import com.spa.app.controllers.BaseController;
import com.spa.app.controllers.ListController;
import com.spa.app.controllers.MainController;
import com.spa.app.controllers.MenuController;
import com.spa.app.controllers.StartController;
import com.spa.app.controllers.UpdateController;
import com.spa.app.controllers.WizardController;
import haxe.ui.toolkit.core.interfaces.IDisplayObject;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Screen;
import haxe.ui.toolkit.events.UIEvent;
import motion.Actuate;
import motion.easing.Linear;

class Views {
	public static var current(default, default):BaseController;
	public static var root(default, default):Root;
	
	private static var _main:MainController;
	public static function main():Void {
		if (_main == null) {
			_main = new MainController();
		}
		showView(_main);
	}

	private static var _start:StartController;
	public static function start():Void {
		if (_start == null) {
			_start = new StartController();
		}
		showView(_start);
	}

	private static var _wizard:WizardController;
	public static function wizard():Void {
		if (_wizard == null) {
			_wizard = new WizardController();
		}
		showView(_wizard);
	}

	private static var _update:UpdateController;
	public static function update():Void {
		if (_update == null) {
			_update = new UpdateController();
		}
		showView(_update);
	}

	private static var _list:ListController;
	public static function list():Void {
		if (_list == null) {
			_list = new ListController();
		}
		showView(_list);
	}
	
	private static var _about:AboutController;
	public static function about():Void {
		if (_about == null) {
			_about = new AboutController();
		}
		showView(_about);
	}

	public static function showView(controller:BaseController):Void {
		if (current != null) {
			current.pause();
		}
		root.removeAllChildren(false);
		controller.refresh();
		root.addChild(controller.view);
		current = controller;
	}
	
	public static function showMenu():Void {
		var controller:MenuController = new MenuController();
		var view:IDisplayObject = controller.view;
		view.id = "menu";
		view.x = Screen.instance.width;
		root.addChild(view);
		Actuate.tween(view, .1, { x: Screen.instance.width - view.width }, true).ease(Linear.easeNone);
		root.addEventListener(UIEvent.MOUSE_DOWN, hideMenu);
	}

	public static function hideMenu(e:UIEvent = null):Void {
		root.removeEventListener(UIEvent.MOUSE_DOWN, hideMenu);
		var view:IDisplayObject = null;
		for (c in root.children) {
			if (c.id == "menu") {
				view = c;
			}
		}
		if (view != null) {
			if (e != null) {
				if (view.hitTest(e.stageX, e.stageY) == true) {
					return;
				}
			}
			Actuate.tween(view, .1, { x: Screen.instance.width }, true).ease(Linear.easeNone).onComplete(function() {
				root.removeChild(view);
			});
		}
	}
}