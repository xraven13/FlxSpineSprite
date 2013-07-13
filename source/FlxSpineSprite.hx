package ;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.geom.Matrix;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.input.FlxMapObject;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import openfl.Assets;
 
import spinehx.AnimationState;
import spinehx.AnimationStateData;
import spinehx.atlas.TextureAtlas;
import spinehx.Bone;
import spinehx.platform.nme.BitmapDataTextureLoader;
import spinehx.platform.nme.renderers.SkeletonRenderer;
import spinehx.platform.nme.renderers.SkeletonRendererDebug;
import spinehx.Skeleton;
import spinehx.SkeletonData;
import spinehx.SkeletonJson;

/**
 * ...
 * @author ...
 */
class FlxSpineSprite extends FlxSprite
{
 
 
    public var skeleton:Skeleton;
	public var skeletonData:SkeletonData;
    public var state:AnimationState;
	public var stateData:AnimationStateData;
	
	
	public var renderer:SkeletonRenderer;
    public var debugRenderer:SkeletonRendererDebug;
 
	public function new( skeletonData:SkeletonData,  X:Float = 0, Y:Float = 0, Width:Int = 0, Height:Int = 0 ) 
	{
		super( X, Y );
	
		this.skeletonData = skeletonData;
		
        stateData = new AnimationStateData(skeletonData);
		
        state = new AnimationState(stateData);

        skeleton = Skeleton.create(skeletonData);
        skeleton.setFlipY(true); 
		
        skeleton.updateWorldTransform();

        lastTime = haxe.Timer.stamp();

        renderer = new SkeletonRenderer(skeleton);
        debugRenderer = new SkeletonRendererDebug(skeleton);
		renderer.visible = debugRenderer.visible = false;
 
		if ( Width == 0 )
		{
			Width = FlxG.width;
		}
		if ( Height == 0 )
		{
			Height = FlxG.height;
		}
		makeGraphic( Width, Height );
		 
		transformMatrix = new Matrix();
		antialiasing = true;
 
			
		maskScale  = new FlxPoint( 1, 1 );
		maskOffset  = new FlxPoint( 0, 0 );
		lastOffset  = new FlxPoint( offset.x, offset.y );
	 
	
	}
	
	public static function readSkeletonData( dataName:String, dataPath:String, scale:Float = 1  ):SkeletonData
	{
		var spineAtlas:TextureAtlas = TextureAtlas.create(Assets.getText( dataPath + dataName + ".atlas" ), dataPath, new BitmapDataTextureLoader());
        var json:SkeletonJson = SkeletonJson.create(spineAtlas);
		json.setScale( scale );
        var skeletonData:SkeletonData = json.readSkeletonData( dataName,  Assets.getText( dataPath + dataName + ".json") );
		return skeletonData;
	}
	
 
	override public function update():Void
	{
		cycleDrawingMode();
		super.update();
	}
 
	override public function draw():Void
	{
		render();
		updateMask();
		super.draw();
		offset.x = lastOffset.x;
		offset.y = lastOffset.y;
	}
	
	
	private var drawingMode:Int = 0;
	private var DRAW_WITH_DEBUG:Int = 0;
	private var DRAW_WITHOUT_DEBUG:Int = 1;
	private var DRAW_DEBUG_ONLY:Int = 2;
	
	public function setDrawingMode( drawWithDebugOrDrawWithoutDebugOrDrawDebugOnly:Int ):Void
	{
		drawingMode = drawWithDebugOrDrawWithoutDebugOrDrawDebugOnly;
	}
	
	private var cycleDrawingModeKey:String = "SPACE";
	private function cycleDrawingMode():Void
	{
		if ( FlxG.keys.justPressed(cycleDrawingModeKey) )
		{
			drawingMode++;
			if ( drawingMode > 2 ) drawingMode = 0;
			setDrawingMode( drawingMode );
		}
	}
	
	
	//extend this to add animation logic
	private function handleAnimations():Void
	{
		
	}
	
	public var timeScale:Float = 1;
	private var lastTime:Float = 0.0;
	private var delta:Float = 0;
	public function render():Void 
	{
		
        delta = (haxe.Timer.stamp() - lastTime) * timeScale;
        lastTime = haxe.Timer.stamp();
        state.update(delta);
        state.apply(skeleton);
		
        handleAnimations();

        skeleton.updateWorldTransform();

		//clear the bitmap data
		framePixels.fillRect( framePixels.rect, 0);
		
        if (drawingMode == 0 || drawingMode == 1)
		{
            renderer.draw();
			drawOnFlxSprite( renderer );
        } 
        if (drawingMode == 0 || drawingMode == 2)
		{
            debugRenderer.draw();
			drawOnFlxSprite( debugRenderer );
        } 
	
		//overlap & collission mask
		updateMask();
 
    }
	
	
	//to make overlap and collision work
	private var overlapMask:FlxSprite;
	private var maskScale:FlxPoint ;
	private var maskOffset:FlxPoint ;
	private var lastOffset:FlxPoint ;
	public function setMask( scaleX:Float = 1, scaleY:Float = 1, offsetX:Float = 0, offsetY:Float = 0 ):Void
	{
		maskScale = new FlxPoint( scaleX, scaleY );
		maskOffset = new FlxPoint( offsetX, offsetY );
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
	
	//adjusting position of sprite depending on transformations
	private var transformMatrix:Matrix;
	private function drawOnFlxSprite( renderer:Sprite ):Void
	{
		var translateX:Float =   (  width / 2  - renderer.width / 2 ) / 2   ;
		var translateY:Float =  ( height / 2 - renderer.height / 2 ) / 2;
 
		transformMatrix.identity();
		transformMatrix.translate( translateX, translateY );
		
		framePixels.draw( renderer, transformMatrix );
	}
	
	
	
}