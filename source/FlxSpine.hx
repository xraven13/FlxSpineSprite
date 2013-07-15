package ;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.system.input.FlxMapObject;
import flixel.system.frontEnds.BitmapFrontEnd;
import flixel.util.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.loaders.SpriteSheetRegion;
import flixel.FlxObject;
import haxe.ds.ObjectMap;
import openfl.Assets;
import spinehx.attachments.Attachment;
import spinehx.attachments.RegionAttachment;
import spinehx.platform.nme.BitmapDataTexture;
import spinehx.Slot;
 
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
class FlxSpine extends FlxSprite
{
	public var skeleton:Skeleton;
	public var skeletonData:SkeletonData;
	public var state:AnimationState;
	public var stateData:AnimationStateData;
	
	public var renderer:SkeletonRenderer;
	
	public var sprites:ObjectMap<RegionAttachment, FlxSprite>;
	public var spriteAngles:ObjectMap<RegionAttachment, Float>;
	
	public var collider:FlxObject;
	
	/**
	 * Instantiate a new Spine Sprite.
	 * @param	skeletonData	Animation data from Spine (.json .skel .png), get it like this: FlxSpineSprite.readSkeletonData( "mySpriteData", "assets/" );
	 * @param	X				The initial X position of the sprite.
	 * @param	Y				The initial Y position of the sprite.
	 * @param	Width			The maximum width of this sprite (avoid very large sprites since they are performance intensive).
	 * @param	Height			The maximum height of this sprite (avoid very large sprites since they are performance intensive).
	 */
	public function new(skeletonData:SkeletonData, X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		
		collider = new FlxObject();
		
		width = 0;
		height = 0;
		
		this.skeletonData = skeletonData;
		
		stateData = new AnimationStateData(skeletonData);
		state = new AnimationState(stateData);
		
		skeleton = Skeleton.create(skeletonData);
		skeleton.setFlipY(true);
	//	skeleton.setFlipX(true);
		
		skeleton.updateWorldTransform();
		
		skeleton.setX(X);
		skeleton.setY(Y);
		
		renderer = new SkeletonRenderer(skeleton);
		renderer.visible = false;
		
		sprites = new ObjectMap<RegionAttachment, FlxSprite>();
		spriteAngles = new ObjectMap<RegionAttachment, Float>();
	}
	
	public function clearBuffers() 
	{
        for (s in sprites)	s.visible = false;
    }
	
	/**
	 * Get Spine animation data.
	 * @param	DataName	TODO
	 * @param	DataPath	TODO
	 * @param	Scale		TODO
	 */
	public static function readSkeletonData(DataName:String, DataPath:String, Scale:Float = 1):SkeletonData
	{
		var spineAtlas:TextureAtlas = TextureAtlas.create(Assets.getText(DataPath + DataName + ".atlas"), DataPath, new BitmapDataTextureLoader());
		var json:SkeletonJson = SkeletonJson.create(spineAtlas);
		json.setScale(Scale);
		var skeletonData:SkeletonData = json.readSkeletonData(DataName, Assets.getText(DataPath + DataName + ".json"));
		return skeletonData;
	}
	
	override public function update():Void
	{
		super.update();
		
		state.update(FlxG.elapsed * FlxG.timeScale);
		state.apply(skeleton);
		skeleton.updateWorldTransform();
	}
	
	/**
	 * Called by game loop, updates then blits or renders current frame of animation to the screen
	 */
	override public function draw():Void
	{
		render();
	}
	
	/**
	 * Called in draw call, draws spine animation into framePixels.
	 */
	private function render():Void 
	{
		var drawOrder:Array<Slot> = skeleton.drawOrder;
		var flipX:Int = (skeleton.flipX) ? -1 : 1;
		var flipY:Int = (skeleton.flipY) ? 1 : -1;
		var flip:Int = flipX * flipY;
		
		_aabb.set(this.x, this.y, 0, 0);
		
		for (slot in drawOrder) 
		{
			var attachment:Attachment = slot.attachment;
			if (Std.is(attachment, RegionAttachment)) 
			{
				var regionAttachment:RegionAttachment = cast(attachment, RegionAttachment);
				regionAttachment.updateVertices(slot);
				var vertices = regionAttachment.getVertices();
                var wrapper:FlxSprite = get(regionAttachment);
				var wrapperAngle:Float = spriteAngles.get(regionAttachment);
                var region:AtlasRegion = cast regionAttachment.getRegion();
                var bone:Bone = slot.getBone();
                var x:Float = regionAttachment.x - region.offsetX;
                var y:Float = regionAttachment.y - region.offsetY;
				
				wrapper.x = bone.worldX + x * bone.m00 + y * bone.m01 + this.x - wrapper.frameWidth * 0.5;
				wrapper.y = bone.worldY + x * bone.m10 + y * bone.m11 + this.y - wrapper.frameHeight * 0.5;
				
                wrapper.angle = (-(bone.worldRotation + regionAttachment.rotation) + wrapperAngle) * flip;
                wrapper.scale.x = (bone.worldScaleX + regionAttachment.scaleX - 1) * flipX;
                wrapper.scale.y = (bone.worldScaleY + regionAttachment.scaleY - 1) * flipY;
				wrapper.antialiasing = FlxG.antialiasByDefault;
                wrapper.visible = true;
				wrapper.draw();
				
				_aabb.union(wrapper.aabb);
            }
		}
		
		collider.x = _aabb.x;
		collider.y = _aabb.y;
		collider.width = _aabb.width;
		collider.height = _aabb.height;
	}
	
	override public function drawDebugOnCamera(Camera:FlxCamera = null):Void
	{
		super.drawDebugOnCamera(Camera);
		
		collider.drawDebugOnCamera(Camera);
		
		var drawOrder:Array<Slot> = skeleton.drawOrder;
		for (slot in drawOrder) 
		{
			var attachment:Attachment = slot.attachment;
			if (Std.is(attachment, RegionAttachment)) 
			{
				var regionAttachment:RegionAttachment = cast(attachment, RegionAttachment);
				var wrapper:FlxSprite = get(regionAttachment);
				wrapper.drawDebugOnCamera(Camera);
            }
		}
	}
	
	public function get(regionAttachment:RegionAttachment):FlxSprite 
	{
        var wrapper:FlxSprite;
		
		if (sprites.exists(regionAttachment))
		{
			return sprites.get(regionAttachment);
		}
		else
		{
            var region:AtlasRegion = cast regionAttachment.getRegion();
            var texture:BitmapDataTexture = cast(region.getTexture(), BitmapDataTexture);
            var bitmapData:BitmapData = texture.bd;
			
			var cached:CachedGraphicsObject = FlxG.bitmap.add(bitmapData);
			var atlasRegion:SpriteSheetRegion = new SpriteSheetRegion(cached, region.getRegionX(), region.getRegionY());
			
            if (region.rotate) 
			{
                atlasRegion.region.tileWidth = atlasRegion.region.width = region.getRegionHeight();
				atlasRegion.region.tileHeight = atlasRegion.region.height = region.getRegionWidth();
            } 
			else 
			{
                atlasRegion.region.tileWidth = atlasRegion.region.width = region.getRegionWidth();
				atlasRegion.region.tileHeight = atlasRegion.region.height = region.getRegionHeight();
            }
			
            wrapper = new FlxSprite(0, 0, atlasRegion);
            wrapper.antialiasing = FlxG.antialiasByDefault;
			wrapper.setOriginToCorner();
            wrapper.origin.x = regionAttachment.width / 2; // Registration point.
            wrapper.origin.y = regionAttachment.height / 2;
            if (region.rotate) 
			{
                wrapper.angle = 90;
                wrapper.origin.x -= region.getRegionWidth();
            }
			
			spriteAngles.set(regionAttachment, wrapper.angle);
            sprites.set(regionAttachment, wrapper);
        }
        return wrapper;
    }
	
	// Debug renderer functionality
	#if !FLX_NO_DEBUG
	private var drawingMode:Int = 0;
	private var DRAW_WITH_DEBUG:Int = 0;
	private var DRAW_WITHOUT_DEBUG:Int = 1;
	private var DRAW_DEBUG_ONLY:Int = 2;
	public function setDrawingMode(drawWithDebugOrDrawWithoutDebugOrDrawDebugOnly:Int):Void
	{
		drawingMode = drawWithDebugOrDrawWithoutDebugOrDrawDebugOnly;
	}
	#end
}