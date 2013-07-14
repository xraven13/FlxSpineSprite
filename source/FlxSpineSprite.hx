package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxColor;

import flash.geom.Matrix;
import flash.display.Sprite;
import flash.display.BitmapData;
import openfl.Assets;

import spinehx.Bone;
import spinehx.Skeleton;
import spinehx.SkeletonData;
import spinehx.SkeletonJson;
import spinehx.AnimationState;
import spinehx.AnimationStateData;
import spinehx.atlas.TextureAtlas;
import spinehx.platform.nme.BitmapDataTextureLoader;
import spinehx.platform.nme.renderers.SkeletonRenderer;
import spinehx.platform.nme.renderers.SkeletonRendererDebug;

/**
 * Special Sprite that can play Animations built with Spine editor: http://esotericsoftware.com/
 * @author Kuris Makku & Sam Batista
 */
class FlxSpineSprite extends FlxSprite
{
	public var skeleton:Skeleton;
	public var skeletonData:SkeletonData;
	public var state:AnimationState;
	public var stateData:AnimationStateData;
	
	public var renderer:SkeletonRenderer;
	#if !FLX_NO_DEBUG
	public var cycleDrawingModeKey:String = "SPACE";
	public var debugRenderer:SkeletonRendererDebug;
	#end
	
	/**
	 * Instantiate a new Spine Sprite.
	 * @param	skeletonData	Animation data from Spine (.json .skel .png), get it like this: FlxSpineSprite.readSkeletonData( "mySpriteData", "assets/" );
	 * @param	X				The initial X position of the sprite.
	 * @param	Y				The initial Y position of the sprite.
	 * @param	Width			The maximum width of this sprite (avoid very large sprites since they are performance intensive).
	 * @param	Height			The maximum height of this sprite (avoid very large sprites since they are performance intensive).
	 */
	public function new( skeletonData:SkeletonData,  X:Float = 0, Y:Float = 0, Width:Int = 0, Height:Int = 0 ) 
	{
		super( X, Y );
		
		this.skeletonData = skeletonData;
		
		stateData = new AnimationStateData(skeletonData);
		state = new AnimationState(stateData);
		
		skeleton = Skeleton.create(skeletonData);
		skeleton.setFlipY( true );
		skeleton.updateWorldTransform();
		
		renderer = new SkeletonRenderer(skeleton);
		renderer.visible = false;
		#if !FLX_NO_DEBUG
		debugRenderer = new SkeletonRendererDebug(skeleton);
		debugRenderer.visible = false;
		#end
		
		if ( Width == 0 )
			Width = FlxG.width;
		if ( Height == 0 )
			Height = FlxG.height;
		
		makeGraphic( Width, Height );
		
		transformMatrix = new Matrix();
		antialiasing = FlxG.antialiasByDefault;
		
		maskScale = new FlxPoint( 1, 1 );
		maskOffset = new FlxPoint( 0, 0 );
		lastOffset = new FlxPoint( offset.x, offset.y );
	}
	
	/**
	 * Get Spine animation data.
	 * @param	DataName	TODO
	 * @param	DataPath	TODO
	 * @param	Scale		TODO
	 */
	public static function readSkeletonData( DataName:String, DataPath:String, Scale:Float = 1  ):SkeletonData
	{
		var spineAtlas:TextureAtlas = TextureAtlas.create(Assets.getText( DataPath + DataName + ".atlas" ), DataPath, new BitmapDataTextureLoader());
		var json:SkeletonJson = SkeletonJson.create( spineAtlas );
		json.setScale( Scale );
		var skeletonData:SkeletonData = json.readSkeletonData( DataName,  Assets.getText( DataPath + DataName + ".json") );
		return skeletonData;
	}
	
	/**
	 * Called by game loop, updates then blits or renders current frame of animation to the screen
	 */
	override public function draw():Void
	{
		render();
		updateMask();
		super.draw();
		
		// update offset to last offset (necessary for masking)
		offset.x = lastOffset.x;
		offset.y = lastOffset.y;
	}
	
	/**
	 * Called in draw call, draws spine animation into framePixels.
	 */
	private function render():Void 
	{
		state.update(FlxG.elapsed * FlxG.timeScale);
		state.apply(skeleton);
		skeleton.updateWorldTransform();
		
		#if !FLX_NO_DEBUG
		if ( FlxG.keys.justPressed(cycleDrawingModeKey) )
		{
			drawingMode++;
			if ( drawingMode > 2 ) drawingMode = 0;
		}
		
		// clear the bitmap data
		var fillColor = (drawingMode == 0 || drawingMode == 1) ? FlxColor.TRANSPARENT : FlxColor.NAVY_BLUE;
		#if flash
		framePixels.fillRect( framePixels.rect, fillColor);
		#else
		_node.item.fillRect( _node.item.rect, fillColor );
		#end
		
		// always draw normal renderer so width and height are properly calculated
		renderer.draw();
		if (drawingMode == 0 || drawingMode == 1)
			drawOnFlxSprite( renderer );
		
		if (drawingMode == 0 || drawingMode == 2)
		{
			debugRenderer.draw();
			drawOnFlxSprite( debugRenderer );
		}
		#else
		// clear the bitmap data
		#if flash
		framePixels.fillRect( framePixels.rect, FlxColor.TRANSPARENT);
		#else
		_node.item.fillRect( _node.item.rect, FlxColor.TRANSPARENT );
		#end
		renderer.draw();
		drawOnFlxSprite( renderer );
		#end
		
		// overlap & collission mask
		updateMask();
	}
	
	// to make overlap and collision work
	private var overlapMask:FlxSprite;
	private var maskScale:FlxPoint ;
	private var maskOffset:FlxPoint ;
	private var lastOffset:FlxPoint ;
	public function setMask( scaleX:Float = 1, scaleY:Float = 1, offsetX:Float = 0, offsetY:Float = 0 ):Void
	{
		maskScale.make( scaleX, scaleY );
		maskOffset.make( offsetX, offsetY );
	}
	private function updateMask():Void
	{
		width = maskScale.x * renderer.width;
		height = maskScale.y * renderer.height;
		lastOffset.x = offset.x;
		lastOffset.y = offset.y;
		offset.x += maskOffset.x;
		offset.y += maskOffset.y;
	}
	
	// adjusting position of sprite depending on transformations
	private var transformMatrix:Matrix;
	private function drawOnFlxSprite( renderer:Sprite ):Void
	{
		// TODO: position spine sprite in center of framePixels container
		var translateX:Float = (renderer.width / 2);
		var translateY:Float = renderer.height;
		
		transformMatrix.identity();
		transformMatrix.translate( translateX, translateY );
		
		#if flash
		framePixels.draw( renderer, transformMatrix );
		#else
		// TODO: Why isn't this rendering the animated sprite on native targets?
		_node.item.draw( renderer, transformMatrix );
		updateAtlasInfo(true);
		#end
	}
	
	// Debug renderer functionality
	#if !FLX_NO_DEBUG
	private var drawingMode:Int = 0;
	private var DRAW_WITH_DEBUG:Int = 0;
	private var DRAW_WITHOUT_DEBUG:Int = 1;
	private var DRAW_DEBUG_ONLY:Int = 2;
	public function setDrawingMode( drawWithDebugOrDrawWithoutDebugOrDrawDebugOnly:Int ):Void
	{
		drawingMode = drawWithDebugOrDrawWithoutDebugOrDrawDebugOnly;
	}
	#end
}