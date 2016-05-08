package patterncraft.memento 
{
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;

	import patterncraft.memento.ViewObject;
	
	public class View extends Sprite
	{
		public var playback:Boolean = false;
		
		private var redCircle:ViewObject;
		private var _position:CurrentPosition;
		private var _mainStage:Stage;
		
		public function View(mainStage:Stage)
		{
			_mainStage = mainStage;
			
			redCircle = new ViewObject();
			addChild(redCircle);
		}
		
		public function get position():CurrentPosition
		{
			return new CurrentPosition(redCircle.x, redCircle.y);
		}
		
		public function set position(currentPosition:CurrentPosition):void
		{
			redCircle.x = currentPosition.x;
			redCircle.y = currentPosition.y;
		}
				
		public function startTracking():void
		{
			_mainStage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		public function stopTracking():void
		{
			_mainStage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(event:Event):void
		{
			if (!playback) 
			{
				redCircle.x += (_mainStage.mouseX - redCircle.x) * .3;
				redCircle.y += (_mainStage.mouseY - redCircle.y) * .3;
			
			}
		}	
	}

}