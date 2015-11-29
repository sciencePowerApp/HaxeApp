package com.spa.app.resources;
import openfl.Assets;

class AssetResourceLoader extends ResourceLoader {
	public function new() {
		super();
	}
	
	public override function getText(resourceId:String, callback:String->Void) {
		var text:String = Assets.getText(resourceId);
		callback(text);
	}
	
}