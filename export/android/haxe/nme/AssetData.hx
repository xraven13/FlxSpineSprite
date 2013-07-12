package nme;


import openfl.Assets;


class AssetData {

	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path.set ("Beep", "Beep");
			type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/data/autotiles.png", "assets_data_autotiles_png");
			type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/autotiles_alt.png", "assets_data_autotiles_alt_png");
			type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/beep.mp3", "assets/data/beep.mp3");
			type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/data/beep.wav", "assets/data/beep.wav");
			type.set ("assets/data/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/data/button.png", "assets_data_button_png");
			type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/courier.ttf", "assets_data_courier_ttf");
			type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/cursor.png", "assets_data_cursor_png");
			type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/default.png", "assets_data_default_png");
			type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/fontData10pt.png", "assets_data_fontdata10pt_png");
			type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/fontData11pt.png", "assets_data_fontdata11pt_png");
			type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/handle.png", "assets_data_handle_png");
			type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/logo.png", "assets_data_logo_png");
			type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/logo_corners.png", "assets_data_logo_corners_png");
			type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/logo_light.png", "assets_data_logo_light_png");
			type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/nokiafc22.ttf", "assets_data_nokiafc22_ttf");
			type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/vcr/flixel.png", "assets_data_vcr_flixel_png");
			type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/open.png", "assets_data_vcr_open_png");
			type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/pause.png", "assets_data_vcr_pause_png");
			type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/play.png", "assets_data_vcr_play_png");
			type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/record_off.png", "assets_data_vcr_record_off_png");
			type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/record_on.png", "assets_data_vcr_record_on_png");
			type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/restart.png", "assets_data_vcr_restart_png");
			type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/step.png", "assets_data_vcr_step_png");
			type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vcr/stop.png", "assets_data_vcr_stop_png");
			type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/vis/bounds.png", "assets_data_vis_bounds_png");
			type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/HaxeFlixel.svg", "assets_haxeflixel_svg");
			type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}
