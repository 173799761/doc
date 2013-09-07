package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import events.UIButtonEvent;
	
	import vo.VOItem;

	[SWF(width="997", height="620")]
	public class test extends Sprite
	{
		private var _xmlLoader:URLLoader = new URLLoader;
		private var _itemVec:Vector.<VOItem> = new Vector.<VOItem>;

		private var _leftBar:LeftBar;
		private var _rightBar:RightBar;
		
		public function test()
		{
			loadXML();
			stage.align = StageAlign.TOP_LEFT;
		}
		
		private function onButtonClick(event:MouseEvent):void
		{
			trace(event);
		}
		
		private function loadXML():void
		{
			_xmlLoader.addEventListener(Event.COMPLETE, onLoadXMLComplete);
			_xmlLoader.load(new URLRequest("data.xml"));
		}
		
		private function onLoadXMLComplete(event:Event):void
		{
			var index:int;
			var xml:XML = new XML(_xmlLoader.data);
			var itemXMLList:XMLList = xml.item;
			for each(var itemXML:XML in itemXMLList)
			{
				var itemVO:VOItem = new VOItem;
				var imgXMLList:XMLList = itemXML.img;
				for each(var imgXML:XML in imgXMLList)
				{
					itemVO.imageVec.push(imgXML.@src);
				}
				itemVO.text = itemXML.text[0];
				itemVO.index = index++;
				_itemVec.push(itemVO);
			}
			
			initLeftBar();
		}
		
		private function initLeftBar():void
		{
			_leftBar = new LeftBar;
			addChild(_leftBar);
			_leftBar.initButtons(_itemVec);
			_leftBar.addEventListener(UIButtonEvent.ITEM_CLICK, onItemClicked);
//			
//			_leftBar.x = 30;
//			_leftBar.y = 70;
			
			//_rightBar
			_rightBar = new RightBar;
			_rightBar.x = 700;
			_rightBar.y = 500;
			addChild(_rightBar);
			
	
		}
		
		private function onItemClicked(event:UIButtonEvent):void
		{
			_rightBar.showImage(event.item);
		}
	}
}