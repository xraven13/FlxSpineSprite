package ;

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.display.Stage;
import flash.filters.GlowFilter;
import flash.geom.Matrix;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import haxe.Log;
import pgr.gconsole.GameConsole;
import spinehx.Animation;
import spinehx.Bone;
import spinehx.BoneData;
 
 

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	
	 private var spineSprite:FlxSpineSprite;
	 
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();
		#end

		super.create();
	 
 
			 
		spineSprite = new FlxSpineSprite("assets/spineboy.atlas", "assets/", "spineboy", "assets/spineboy.json", 0, 0, 600, 600 );
		add( spineSprite );
		 
	 	GameConsole.init();
		GameConsole.log("This text will be logged.");
	  
	 
		
	} 

 
	
	private function log( data:Dynamic ):Void
	{
		if ( FlxG.keys.pressed("SPACE") )
		{
			GameConsole.log( data );
		}
	}
	
	private function logs( array:Array<Dynamic>):Void
	{
		for ( i in 0...array.length )
		{
			log( array[i] );
		}
	}
	  
	override public function update():Void
	{
	
 
		if ( FlxG.keys.pressed("RIGHT") )
		{
			 
			spineSprite.x += 500 * FlxG.elapsed;
 
		}
		else if ( FlxG.keys.pressed("LEFT") )
		{
		 
			spineSprite.x -= 500 * FlxG.elapsed;
		}
		 
		
	 	if ( FlxG.keys.justPressed( "A") )
		{
			 spineSprite.angle += 20; 
		} 
		if ( FlxG.keys.justPressed( "D") )
		{
			 spineSprite.angle -= 20; 
		}
		
		if ( FlxG.keys.justPressed( "R") )
		{
			 spineSprite.scale.x += 0.2;
		} 
		if ( FlxG.keys.justPressed( "T") )
		{
			 spineSprite.scale.x -= 0.2; 
		}
		
		if ( FlxG.keys.justPressed("F") )
		{
			spineSprite.origin.x = 0;
		}
		if ( FlxG.keys.justPressed("G") )
		{
			spineSprite.origin.x = spineSprite.width / 2;
		}
 
		
		
		
		
		super.update();
		
	 
	}
}