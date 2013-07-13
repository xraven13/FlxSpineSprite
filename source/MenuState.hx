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
import spinehx.Animation;
import spinehx.Bone;
import spinehx.BoneData;
import testclasses.SpineBoyTest;
 
 
 

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
	 
 
			 
		spineSprite = new SpineBoyTest( FlxSpineSprite.readSkeletonData( "spineboy", "assets/" ), 0, 0, 600, 600 );
		add( spineSprite );
		  
	  
	 
		
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