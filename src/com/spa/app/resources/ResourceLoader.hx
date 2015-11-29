package com.spa.app.resources;

class ResourceLoader {
	public function new() {
	}

	public function getText(resourceId:String, callback:String->Void) {
		throw "ResourceLoader::getText not implemented!";
	}
	
	public function getXML(resourceId:String, callback:Xml->Void) {
		getText(resourceId, function(xmlString:String) {
			var xml:Xml = Xml.parse(xmlString);
			callback(xml);
		});
	}
}