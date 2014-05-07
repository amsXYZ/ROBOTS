package objects 
{
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.animation.AnimationStateData;
	import spine.atlas.Atlas;
	import spine.attachments.AtlasAttachmentLoader;
	import spine.starling.StarlingTextureLoader;
	import spine.starling.SkeletonAnimation;
	import spine.starling.StarlingAtlasAttachmentLoader;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Eric Oliver Obiol, EGOD
	 */
	public class HNano extends Hipsbot 
	{
		
		public function HNano(setI:uint, setJ:uint) 
		{
			super(setI, setJ);
			
		}
		
		override protected function sonInteraction(aimI:uint, aimJ:uint):void 
		{
			switch(0)
			{
				case 0:
					trace("I can drain dat NanoBitch");
					break;
				default:
					trace("I can't do that.");
					break;
			}
			trace("HNano Contextual Interaction");
		}
		
		override protected function sonSpecial(aimI:uint, aimJ:uint):void
		{
			trace("PLASMA RUN!");
			this.state = 1;
		}
		
		override protected function setSprite():void
		{
			var atlas:Atlas = new Atlas(new Assets.NBotAtlas(), new StarlingTextureLoader(new Assets.NBotTexture()));
			var json:SkeletonJson = new SkeletonJson(new AtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(new Assets.NBotJson());

			var stateData:AnimationStateData = new AnimationStateData(skeletonData);

			skeleton = new SkeletonAnimation(skeletonData, stateData);
			skeleton.pivotX = 0;
			skeleton.pivotY = 100;
			
			skeleton.state.onStart.add(function (trackIndex:int) : void {
				//trace(trackIndex + " start: " + skeleton.state.getCurrent(trackIndex));
			});
			skeleton.state.onEnd.add(function (trackIndex:int) : void {
				//trace(trackIndex + " end: " + skeleton.state.getCurrent(trackIndex));
			});
			skeleton.state.onComplete.add(function (trackIndex:int, count:int) : void {
				//trace(trackIndex + " complete: " + skeleton.state.getCurrent(trackIndex) + ", " + count);
			});
			
			skeleton.skeleton.skinName = "FRONT";
			skeleton.skeleton.setSlotsToSetupPose();
			skeleton.state.setAnimationByName(1, "front_walk", false);
			skeleton.state.setAnimationByName(0, "front_idle", true);

			this.addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}