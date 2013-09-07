package events
{
	import flash.events.Event;
	
	import vo.VOItem;
	
	public class UIButtonEvent extends Event
	{
		public static const ITEM_CLICK:String = "itemClick";

		private var _vo:VOItem;
		public function UIButtonEvent(type:String, vo:VOItem)
		{
			super(type, true);
			this._vo = vo;
			
		}

		public function get item():VOItem
		{
			return _vo;
		}

	}
}