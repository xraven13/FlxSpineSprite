package testclasses;
import flixel.FlxG;
import spinehx.Animation;
import spinehx.Skeleton;
import spinehx.SkeletonData;

/**
 * ...
 * @author Kris
 */
class GoblinTest extends FlxSpineSprite
{

	
	private var animation:Animation;
	private var time:Float = 0;
	public function new( skeletonData:SkeletonData,  X:Float = 0, Y:Float = 0, Width:Int = 0, Height:Int = 0 ) 
	{
		super( skeletonData, X, Y, Width, Height );
		
		animation = skeletonData.findAnimation("walk");
		
		skeleton.setSkinByName("goblin");
		skeleton.setToSetupPose();
		skeleton = Skeleton.copy(skeleton);
		skeleton.setX(250);
        skeleton.setY(320);
        skeleton.setFlipY(true);
		skeleton.updateWorldTransform();
	}
	
	override private function handleAnimations():Void
	{
		
/*		var x:Float = skeleton.getX() + 160 * deltaTime * (skeleton.getFlipX() ? -1 : 1);
		if (x > FlxG.stage.stageWidth) skeleton.setFlipX(true);
		if (x < 0) skeleton.setFlipX(false);
        skeleton.setX(x);*/

		time += delta;
		animation.apply(skeleton, time, true);
		
		if ( FlxG.mouse.justPressed() )
		{
	
			skeleton.setSkinByName(skeleton.getSkin().getName() == "goblin" ? "goblingirl" : "goblin");
			skeleton.setSlotsToSetupPose();
			 
		}
	}
	
}