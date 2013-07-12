package nme;


import openfl.Assets;


class AssetData {

	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path.set ("Beep", "assets/data/beep.wav");
			type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/data/autotiles.png", "assets/data/autotiles.png");
			type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/autotiles_alt.png", "assets/data/autotiles_alt.png");
			type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/beep.mp3", "assets/data/beep.mp3");
			type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/data/beep.wav", "assets/data/beep.wav");
			type.set ("assets/data/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/data/button.png", "assets/data/button.png");
			type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/courier.ttf", "assets/data/courier.ttf");
			type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/cursor.png", "assets/data/cursor.png");
			type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/default.png", "assets/data/default.png");
			type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/fontData10pt.png", "assets/data/fontData10pt.png");
			type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/fontData11pt.png", "assets/data/fontData11pt.png");
			type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/handle.png", "assets/data/handle.png");
			type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/logo.png", "assets/data/logo.png");
			type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/logo_corners.png", "assets/data/logo_corners.png");
			type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/logo_light.png", "assets/data/logo_light.png");
			type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/nokiafc22.ttf", "assets/data/nokiafc22.ttf");
			type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/vcr/flixel.png", "assets/data/vcr/flixel.png");
			type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/open.png", "assets/data/vcr/open.png");
			type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/pause.png", "assets/data/vcr/pause.png");
			type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/play.png", "assets/data/vcr/play.png");
			type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/record_off.png", "assets/data/vcr/record_off.png");
			type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/record_on.png", "assets/data/vcr/record_on.png");
			type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/restart.png", "assets/data/vcr/restart.png");
			type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/step.png", "assets/data/vcr/step.png");
			type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/stop.png", "assets/data/vcr/stop.png");
			type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vis/bounds.png", "assets/data/vis/bounds.png");
			type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/HaxeFlixel.svg", "assets/HaxeFlixel.svg");
			type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}
