package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import vo.VOItem;
	
	public class RightBar extends Sprite
	{
		private var _imageLoader:Loader;
		
		public function RightBar()
		{
			super();
		}
		
		public function showImage(item:VOItem):void
		{
			if (_imageLoader)
			{
				this.removeChild(_imageLoader);
				_imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);
			}
			_imageLoader = new Loader;
			_imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			_imageLoader.load(new URLRequest(item.imageVec[0]));
			addChild(_imageLoader);
		}
		
		private function onLoadComplete(event:Event):void
		{
			
		}
	}
}