package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import events.UIButtonEvent;
	
	import vo.VOItem;
	
	[Event(name="itemClick", type="events.UIButtonEvent")]
	
	public class UIButton extends Sprite
	{

		private var _vo:VOItem;
		private var _label:TextField;
		
		public function UIButton(vo:VOItem)
		{
			super();
			this._vo = vo;
			initButton();
			initEvents();
		}
		
		private function initEvents():void
		{
			this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onRollOut(event:MouseEvent):void
		{
			this.alpha = 1;
		}
		
		private function onRollOver(event:MouseEvent):void
		{
			this.alpha = 0.5;
		}
		
		private function onClick(event:MouseEvent):void
		{
			this.dispatchEvent(new UIButtonEvent(UIButtonEvent.ITEM_CLICK, _vo));
		}
		
		private function initButton():void
		{
			_label = new TextField;
			_label.autoSize = TextFieldAutoSize.LEFT;
			_label.text = String(_vo.index);
			addChild(_label);
			this.mouseChildren = false;
		}
	}
}