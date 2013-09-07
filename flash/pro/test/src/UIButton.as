package
{
	import flash.events.MouseEvent;
	
	import events.UIButtonEvent;
	
	import vo.VOItem;
	
	[Event(name="itemClick", type="events.UIButtonEvent")]
	
	public class UIButton extends glen2
	{

		private var _vo:VOItem;
		
		public function UIButton()
		{
			super();
			initButton();
			initEvents();
		}
		
		private function initEvents():void
		{
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void
		{
			this.dispatchEvent(new UIButtonEvent(UIButtonEvent.ITEM_CLICK, _vo));
		}
		
		private function initButton():void
		{
			m_label.mouseEnabled = false;
		}

		public function get data():VOItem
		{
			return _vo;
		}

		public function set data(value:VOItem):void
		{
			_vo = value;
			m_label.text = String(_vo.index);
		}

	}
}