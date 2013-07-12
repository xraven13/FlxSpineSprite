package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new #if haxe3 Map <String, #else Hash <#end Dynamic> ();
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			className.set ("Beep", nme.NME_assets_data_beep_mp3);
			type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
			className.set ("assets/data/autotiles.png", nme.NME_assets_data_autotiles_png);
			type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/autotiles_alt.png", nme.NME_assets_data_autotiles_alt_png);
			type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/beep.mp3", nme.NME_assets_data_beep_mp4);
			type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/data/button.png", nme.NME_assets_data_button_png);
			type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/courier.ttf", nme.NME_assets_data_courier_ttf);
			type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/data/cursor.png", nme.NME_assets_data_cursor_png);
			type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/default.png", nme.NME_assets_data_default_png);
			type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/fontData10pt.png", nme.NME_assets_data_fontdata10pt_png);
			type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/fontData11pt.png", nme.NME_assets_data_fontdata11pt_png);
			type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/handle.png", nme.NME_assets_data_handle_png);
			type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo.png", nme.NME_assets_data_logo_png);
			type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo_corners.png", nme.NME_assets_data_logo_corners_png);
			type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo_light.png", nme.NME_assets_data_logo_light_png);
			type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/nokiafc22.ttf", nme.NME_assets_data_nokiafc22_ttf);
			type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/data/vcr/flixel.png", nme.NME_assets_data_vcr_flixel_png);
			type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/open.png", nme.NME_assets_data_vcr_open_png);
			type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/pause.png", nme.NME_assets_data_vcr_pause_png);
			type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/play.png", nme.NME_assets_data_vcr_play_png);
			type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/record_off.png", nme.NME_assets_data_vcr_record_off_png);
			type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/record_on.png", nme.NME_assets_data_vcr_record_on_png);
			type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/restart.png", nme.NME_assets_data_vcr_restart_png);
			type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/step.png", nme.NME_assets_data_vcr_step_png);
			type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/stop.png", nme.NME_assets_data_vcr_stop_png);
			type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vis/bounds.png", nme.NME_assets_data_vis_bounds_png);
			type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/goblins.atlas", nme.NME_assets_goblins_atlas);
			type.set ("assets/goblins.atlas", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/goblins.json", nme.NME_assets_goblins_json);
			type.set ("assets/goblins.json", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/goblins.png", nme.NME_assets_goblins_png);
			type.set ("assets/goblins.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/goblins.skel", nme.NME_assets_goblins_skel);
			type.set ("assets/goblins.skel", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/HaxeFlixel.svg", nme.NME_assets_haxeflixel_svg);
			type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/nme.svg", nme.NME_assets_nme_svg);
			type.set ("assets/nme.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/spineboy.atlas", nme.NME_assets_spineboy_atlas);
			type.set ("assets/spineboy.atlas", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/spineboy.json", nme.NME_assets_spineboy_json);
			type.set ("assets/spineboy.json", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/spineboy.png", nme.NME_assets_spineboy_png);
			type.set ("assets/spineboy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/spineboy.skel", nme.NME_assets_spineboy_skel);
			type.set ("assets/spineboy.skel", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/data/autotiles.png", nme.NME_assets_data_autotiles_png1);
			type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/autotiles_alt.png", nme.NME_assets_data_autotiles_alt_png1);
			type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/button.png", nme.NME_assets_data_button_png1);
			type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/cursor.png", nme.NME_assets_data_cursor_png1);
			type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/default.png", nme.NME_assets_data_default_png1);
			type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/fontData10pt.png", nme.NME_assets_data_fontdata11);
			type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/fontData11pt.png", nme.NME_assets_data_fontdata12);
			type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/handle.png", nme.NME_assets_data_handle_png1);
			type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo.png", nme.NME_assets_data_logo_png1);
			type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo_corners.png", nme.NME_assets_data_logo_corners_png1);
			type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/logo_light.png", nme.NME_assets_data_logo_light_png1);
			type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/flixel.png", nme.NME_assets_data_vcr_flixel_png1);
			type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/open.png", nme.NME_assets_data_vcr_open_png1);
			type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/pause.png", nme.NME_assets_data_vcr_pause_png1);
			type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/play.png", nme.NME_assets_data_vcr_play_png1);
			type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/record_off.png", nme.NME_assets_data_vcr_record_off_png1);
			type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/record_on.png", nme.NME_assets_data_vcr_record_on_png1);
			type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/restart.png", nme.NME_assets_data_vcr_restart_png1);
			type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/step.png", nme.NME_assets_data_vcr_step_png1);
			type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vcr/stop.png", nme.NME_assets_data_vcr_stop_png1);
			type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/data/vis/bounds.png", nme.NME_assets_data_vis_bounds_png1);
			type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/goblins.png", nme.NME_assets_goblins_png1);
			type.set ("assets/goblins.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/spineboy.png", nme.NME_assets_spineboy_png1);
			type.set ("assets/spineboy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			className.set ("assets/goblins.json", nme.NME_assets_goblins_json1);
			type.set ("assets/goblins.json", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/spineboy.json", nme.NME_assets_spineboy_json1);
			type.set ("assets/spineboy.json", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/goblins.atlas", nme.NME_assets_goblins_atlas1);
			type.set ("assets/goblins.atlas", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/spineboy.atlas", nme.NME_assets_spineboy_atlas1);
			type.set ("assets/spineboy.atlas", Reflect.field (AssetType, "text".toUpperCase ()));
			className.set ("assets/goblins.skel", nme.NME_assets_goblins_skel1);
			type.set ("assets/goblins.skel", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/spineboy.skel", nme.NME_assets_spineboy_skel1);
			type.set ("assets/spineboy.skel", Reflect.field (AssetType, "binary".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}


class NME_assets_data_beep_mp3 extends flash.media.Sound { }
class NME_assets_data_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_beep_mp4 extends flash.media.Sound { }
class NME_assets_data_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_courier_ttf extends flash.text.Font { }
class NME_assets_data_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata10pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_nokiafc22_ttf extends flash.text.Font { }
class NME_assets_data_vcr_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_goblins_atlas extends flash.utils.ByteArray { }
class NME_assets_goblins_json extends flash.utils.ByteArray { }
class NME_assets_goblins_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_goblins_skel extends flash.utils.ByteArray { }
class NME_assets_haxeflixel_svg extends flash.utils.ByteArray { }
class NME_assets_nme_svg extends flash.utils.ByteArray { }
class NME_assets_spineboy_atlas extends flash.utils.ByteArray { }
class NME_assets_spineboy_json extends flash.utils.ByteArray { }
class NME_assets_spineboy_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spineboy_skel extends flash.utils.ByteArray { }
class NME_assets_data_autotiles_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_autotiles_alt_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_button_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_cursor_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_default_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata11 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_fontdata12 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_handle_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_corners_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_logo_light_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_flixel_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_open_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_pause_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_play_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_off_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_record_on_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_restart_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_step_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vcr_stop_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_data_vis_bounds_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_goblins_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spineboy_png1 extends flash.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_goblins_json1 extends flash.utils.ByteArray { }
class NME_assets_spineboy_json1 extends flash.utils.ByteArray { }
class NME_assets_goblins_atlas1 extends flash.utils.ByteArray { }
class NME_assets_spineboy_atlas1 extends flash.utils.ByteArray { }
class NME_assets_goblins_skel1 extends flash.utils.ByteArray { }
class NME_assets_spineboy_skel1 extends flash.utils.ByteArray { }
