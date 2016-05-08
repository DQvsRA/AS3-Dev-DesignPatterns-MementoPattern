package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	import patterncraft.memento.MementoPattern;
	
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	
	[SWF(width="900", height="480", backgroundColor="#000000", frameRate="31")]
	public class Main extends Sprite 
	{
		private var mementoPattern:MementoPattern;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			MakeDiscription();
			PlaceObjectToStage();
		
		}
		
		private function MakeDiscription():void 
		{
			var yOffset:uint = 10;
			yOffset = TextFieldMaker("Space = Start Drag Object", 10, yOffset, 0xffffff);
			yOffset = TextFieldMaker("MouseDown = Start RECORDING Object Position", 10, yOffset, 0xffffff);
			yOffset = TextFieldMaker("C = Clear Buffer", 10, yOffset, 0xffffff);
			
		}
		
		private function TextFieldMaker(text:String, xOffset:uint, yOffset:uint, color:uint):uint 
		{
			var textDiscription:TextField = new TextField();
			textDiscription.text = String(text);
			textDiscription.width = textDiscription.textWidth + 5
			textDiscription.textColor = color;
			textDiscription.x = xOffset;
			textDiscription.y = yOffset;
			
			stage.addChild(textDiscription);
			
			return yOffset + textDiscription.textHeight + 3;
		}
		
		
		private function PlaceObjectToStage():void 
		{
			mementoPattern = new MementoPattern(this.stage);
		}
		
	}
	
}