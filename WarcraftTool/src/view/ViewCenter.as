package view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	import utils.DragViewManager;

	/**
	 *
	 * @author feng 2015-11-14
	 */
	public class ViewCenter extends Proxy
	{
		public var viewLayer:Sprite;

		public var viewClsDic:Dictionary;
		private var viewDic:Dictionary;
		private var stateDic:Dictionary;

		public function ViewCenter(viewLayer:Sprite)
		{
			this.viewLayer = viewLayer;

			viewClsDic = new Dictionary();
			viewDic = new Dictionary();
			stateDic = new Dictionary();
		}

		override flash_proxy function getProperty(name:*):*
		{
			return stateDic[name];
		}

		override flash_proxy function setProperty(name:*, value:*):void
		{
			stateDic[name] = value;

			var showView:DisplayObject = getView(name);
			if (value)
			{
				viewLayer.addChild(showView);
			}
			else
			{
				if (showView.parent != null)
					showView.parent.removeChild(showView);
			}
		}

		public function getView(name:String):DisplayObject
		{
			if (viewDic[name] == null)
			{
				viewDic[name] = new viewClsDic[name];
//				DragViewManager.register(viewDic[name]);
			}

			return viewDic[name];
		}
	}
}
