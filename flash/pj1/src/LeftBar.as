package
{
	import flash.display.Sprite;
	
	import vo.VOItem;
	
	[Event(name="itemClick", type="events.UIButtonEvent")]
	
	public class LeftBar extends Sprite
	{
		public function LeftBar()
		{
			super();
		}
		
		public function initButtons(_itemVec:Vector.<VOItem>):void
		{
			var colCount:int = 5;
			
			for (var i:int = 0; i < _itemVec.length; i++)
			{
				var button:UIButton = new UIButton(_itemVec[i]);
				var row:int = i / colCount;
				var col:int = i % colCount;
				
				button.x = col * 30;
				button.y = row * 30;
				addChild(button);
			}
		}
	}
}