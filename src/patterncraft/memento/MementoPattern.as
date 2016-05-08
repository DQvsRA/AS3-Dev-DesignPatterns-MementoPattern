package patterncraft.memento 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	import patterncraft.memento.View;
	import patterncraft.memento.RecordController;
	 
	[SWF(width="900", height="480", backgroundColor="#000000", frameRate="31")]
	public class MementoPattern extends Sprite
	{
		private var view:View;
		private var viewRecordController:RecordController;
		private var isCareTaking:Boolean = false; 
		private var _mainStage:Stage;
		
		private static const C:uint = 67
		
		public function MementoPattern(mainStage:Stage) 
		{
			_mainStage = mainStage;
			view = new View(_mainStage);
			
			_mainStage.addChild(view);
			
			viewRecordController = new RecordController(view);
			
			trace("LISTEN FOR KEYS");
			_mainStage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			_mainStage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		private function keyUpHandler(e:KeyboardEvent):void 
		{
			switch(e.keyCode)
			{
				case Keyboard.RIGHT:
					view.playback = false;
					break;
					
				case Keyboard.LEFT:
					view.playback = false;
					break;
			}
		}
		
		private function keyDownHandler(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.SPACE:
					if(isCareTaking)
					{
						trace("STOP");
						viewRecordController.stopMovingObject();
					}
					else
					{
						trace("START");
						viewRecordController.startMovingObject(_mainStage);
					}
					
					isCareTaking = !isCareTaking;
					break;
					
				case Keyboard.RIGHT:
					view.playback = true;
					viewRecordController.nextPosition();
					break;
					
				case Keyboard.LEFT:
					view.playback = true;
					viewRecordController.previousPosition();
					break;
				
				case C:
					trace("CLEAR!");
					viewRecordController.Clear();
					break;
			}
		}
		
	}

}