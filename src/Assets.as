package  
{
	/**
	 * ...
	 * @author EGOD
	 */
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets 
	{
		[Embed(source = "../media/graphics/Baldosa.png")]
		public static const Floor:Class;
		
		[Embed(source = "../media/graphics/Columna.png")]
		public static const Wall:Class;
	
		[Embed(source = "../media/graphics/robot.png")]
		public static const Robot:Class;
		
		[Embed(source = "../media/graphics/HMini.png")]
		public static const Robot_M:Class;
		
		[Embed(source = "../media/graphics/HNano.png")]
		public static const Robot_N:Class;
		
		[Embed(source = "../media/graphics/HIPS1.png")]
		public static const Icon_1:Class;
		
		[Embed(source = "../media/graphics/HIPS2.png")]
		public static const Icon_2:Class;
		
		[Embed(source = "../media/graphics/HIPS3.png")]
		public static const Icon_3:Class;
		
		[Embed(source = "../media/graphics/ChooseLeft.png")]
		public static const LeftBtn:Class;
		
		[Embed(source = "../media/graphics/ChooseRight.png")]
		public static const RightBtn:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		/*private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source = "../media/graphics/mySpriteSheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../media/graphics/mySpriteSheet.xml",mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source = "../media/fonts/embedded/BD_Cartoon_Shout.ttf",fontFamily="MyFontName",embedAsCFF="false")]
		public static var MyFont:Class;
		
		//SE PUEDEN INTRODUCIR TAMBIÉN BITMAP FONTS QUE SON MÁS EFICIENTES (MIRAR TUTORIAL SI SE DESEA)
		
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null) 
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		*/
		
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
					var bitmap:Bitmap = new Assets[name]();
					gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
	}

}