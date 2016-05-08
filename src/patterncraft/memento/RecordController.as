package patterncraft.memento 
{
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
	public class RecordController
	{
		private var view:View;
		
		public var positingStorage:Array = [];
		
		private var currentPositionIndex:uint = 0;
		private var _stage:Stage;
		
		public function RecordController(view:View)
		{
			this.view = view;
		}
		
		public function startMovingObject(stage:Stage):void
		{
			_stage = stage;
			
			view.startTracking();
			_stage.addEventListener(MouseEvent.MOUSE_DOWN, startRecord);
		}
		
		public function stopMovingObject():void
		{
			view.stopTracking();
			if (_stage.hasEventListener(MouseEvent.MOUSE_UP))
			{
				_stage.removeEventListener(MouseEvent.MOUSE_UP, stopRecord);
			}
			if (_stage.hasEventListener(MouseEvent.MOUSE_DOWN))
			{
				_stage.removeEventListener(MouseEvent.MOUSE_DOWN, startRecord);
			}
			if (_stage.hasEventListener(Event.ENTER_FRAME))
			{
				_stage.removeEventListener(Event.ENTER_FRAME, Recording);
			}
			
			currentPositionIndex = positingStorage.length;
		}
		
		private function startRecord(event:MouseEvent):void
		{
			_stage.addEventListener(MouseEvent.MOUSE_UP, stopRecord);
			_stage.addEventListener(Event.ENTER_FRAME, Recording);
		}
		
		private function stopRecord(e:MouseEvent):void 
		{
			if (_stage.hasEventListener(MouseEvent.MOUSE_UP))
			{
				_stage.removeEventListener(MouseEvent.MOUSE_UP, stopRecord);
			}
			
			_stage.removeEventListener(Event.ENTER_FRAME, Recording);
			currentPositionIndex = positingStorage.length;
		}
		
		private function Recording(event:Event):void
		{
			var currentPosition:CurrentPosition = view.position;
			positingStorage.push(currentPosition);
		}
		
		public function nextPosition():void
		{
			if(currentPositionIndex < positingStorage.length - 1)
			{
				currentPositionIndex++;
				
				var currentPosition:CurrentPosition = positingStorage[currentPositionIndex];
				view.position = currentPosition;
			}
		}
		
		public function previousPosition():void
		{
			if(currentPositionIndex > 0)
			{
				currentPositionIndex--;
				
				var currentPosition:CurrentPosition = positingStorage[currentPositionIndex];
				view.position = currentPosition;
			}
		}
		
		public function Clear():void
		{
			positingStorage = [];
		}
	}

}