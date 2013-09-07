package
{
	import flash.events.MouseEvent;
	
	import events.UIButtonEvent;
	
	import vo.VOItem;
	
	[Event(name="itemClick", type="events.UIButtonEvent")]
	
	public class LeftBar extends LogoAsset
	{
		private var _page:int;
		private var _itemVec:Vector.<VOItem>;
		private var _buttonVec:Vector.<UIButton>;
		private var _lastSelectedButton:UIButton;
		private const TOTAL:int = 40;
		
		public function LeftBar()
		{
			super();
			this.m_button.addEventListener(MouseEvent.CLICK, onFlipPage);
			m_str.mouseEnabled = false;
		}
		
		private function onFlipPage(event:MouseEvent):void
		{
			if (page == 0)
				page = 1;
			else
				page = 0;
			
			m_str.text = "第" + String(page) + "页作品";
		}
		
		public function initButtons(itemVec:Vector.<VOItem>):void
		{
			_itemVec = itemVec;
			_buttonVec = new Vector.<UIButton>;
			var colCount:int = 5;
			var totalButton:int = Math.min(TOTAL, itemVec.length);
			for (var i:int = 0; i < totalButton; ++i)
			{
				var button:UIButton = new UIButton();
				var row:int = i / colCount;
				var col:int = i % colCount;
				button.x = col * 60 + 30;
				button.y = row * 40 + 200;
				button.addEventListener(UIButtonEvent.ITEM_CLICK, onClick);
				_buttonVec.push(button);
				addChild(button);
			}
			this.page = 0;
			m_str.text = "第" + String(page) + "页作品";
		}
		
		private function onClick(event:UIButtonEvent):void
		{
			if (_lastSelectedButton)
				_lastSelectedButton.visible = true;
			_lastSelectedButton = event.currentTarget as UIButton;
			_lastSelectedButton.visible = false;
		}
		
		public function get page():int
		{
			return _page;
		}

		public function set page(value:int):void
		{
			_page = value;
			
			var start:int = _page * TOTAL;
			var end:int = Math.min(_itemVec.length, start + TOTAL);
			var buttonIndex:int;
			
			for (var i:int = start; i < end; i++)
			{
				var button:UIButton = _buttonVec[buttonIndex++];
				button.visible = true;
				button.data = _itemVec[i];
			}
			
			for (var j:int = buttonIndex; j < _buttonVec.length; j++)
				_buttonVec[j].visible = false;
		}

	}
}