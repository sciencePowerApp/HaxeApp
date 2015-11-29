package com.spa.app.engine;
import com.spa.app.resources.ResourceLoaderFactory.ResourceType;

class Manifest {
	public var entryPoint:String;
	public var resources:Array<ManifestResourceEntry> = new Array<ManifestResourceEntry>();
	
	public function new() {
	}
	
	public function fromXML(xml:Xml) {
		xml = xml.firstElement();
		entryPoint = xml.get("entryPoint");
		
		for (el in xml.elementsNamed("resource")) {
			var r = new ManifestResourceEntry();
			r.fromXML(el);
			resources.push(r);
		}
	}
}

class ManifestResourceEntry {
	public function new() {
	}

	public var id:String;
	public var type:ResourceType;
	
	public var extension(get, never):String;
	private function get_extension():String {
		var ext:String = null;
		if (id.indexOf(".") != -1) {
			var arr:Array<String> = id.split(".");
			ext = arr[arr.length - 1];
		}
		return ext;
	}
	
	public function fromXML(xml:Xml) {
		id = xml.get("id");
		switch (xml.get("type")) {
			case "asset":
				type = ResourceType.ASSET;
			default:
				trace("Unknown resource type: " + xml.get("type"));
		}
	}
}