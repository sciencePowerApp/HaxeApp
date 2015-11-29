package com.spa.app.resources;

enum ResourceType {
	ASSET;
}

class ResourceLoaderFactory {
	public static function get(type:ResourceType):ResourceLoader {
		var loader:ResourceLoader = null;
		switch (type) {
			case ResourceType.ASSET:
				loader = new AssetResourceLoader();
		}
		
		if (loader == null) {
			throw "Resource loader not found for " + type;
		}
		
		return loader;
	}
}