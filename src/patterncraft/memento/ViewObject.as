package patterncraft.memento 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Vladimir Minkin
	 */
	public class ViewObject extends Sprite
	{
		public function ViewObject()
		{
			graphics.beginFill(0xcc0000);
			graphics.drawCircle(0, 0, 20);
			graphics.endFill();
		}
	}

}