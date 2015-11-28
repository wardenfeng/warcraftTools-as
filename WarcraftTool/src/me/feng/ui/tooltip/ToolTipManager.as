package me.feng.ui.tooltip
{

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	/**
	 * 提示工具管理类
	 * @author warden_feng 2015-2-8
	 */
	public class ToolTipManager
	{
		/** 默认tip类 */
		private static const defaultCla:Class = ToolTip;
		/** tip容器 */
		private static var tipContainer:DisplayObjectContainer;
		/** 注册了tip的显示对象字典 */
		private static var disODic:Dictionary = new Dictionary();
		/** tip字典 */
		private static var tipDic:Dictionary = new Dictionary();
		/** 触发tip的显示对象 */
		private static var _tipTarget:DisplayObject;

		/**
		 * 触发tip的显示对象
		 */
		private static function get tipTarget():DisplayObject
		{
			return _tipTarget;
		}

		/**
		 * 触发tip的显示对象
		 */
		private static function set tipTarget(value:DisplayObject):void
		{
			if (_tipTarget != null && _tipTarget.hasEventListener(MouseEvent.MOUSE_MOVE))
			{
				_tipTarget.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
				removeTip(_tipTarget);
			}
			_tipTarget = value;
			if (_tipTarget != null && !_tipTarget.hasEventListener(MouseEvent.MOUSE_MOVE))
			{
				_tipTarget.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
				addTip(_tipTarget);
			}
		}

		/**
		 * 注册tip
		 * @param disO		注册tip的显示对象
		 * @param data		tip显示的数据
		 * @param tipClas	tip类型
		 */
		public static function register(disO:DisplayObject, data:Object, tipClas:Class = null):void
		{
			unregister(disO);

			disODic[disO] = {disO: disO, data: data, tipClas: tipClas};
			disO.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			disO.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}

		/**
		 * 注销tip
		 * @param disO		tip显示的数据
		 */
		public static function unregister(disO:DisplayObject):void
		{
			if (disO.hasEventListener(MouseEvent.ROLL_OVER))
			{
				disO.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
			}
			if (disO.hasEventListener(MouseEvent.ROLL_OUT))
			{
				disO.removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
			}
			if (tipTarget == disO)
			{
				tipTarget = null;
			}
			if (disODic[disO] != null)
			{
				delete disODic[disO];
			}
		}

		/**
		 * 是否有注册tip
		 * @param disO		tip显示的数据
		 * @return 			是否有注册tip
		 */
		public static function hasTip(disO:DisplayObject):Boolean
		{
			if (disODic[disO] != null)
			{
				return true;
			}
			return false;
		}

		/**
		 * 处理鼠标移动事件
		 */
		protected static function onMouseMove(event:MouseEvent):void
		{
			var disO:DisplayObject = event.currentTarget as DisplayObject;
			var toolTip:IToolTip = getToolTip(disO) as IToolTip;

			toolTip.data = disODic[disO].data;
			toolTip.updatePosition();
		}

		/**
		 * 处理鼠标移出事件
		 */
		private static function onRollOut(event:Event):void
		{
			var disO:DisplayObject = event.currentTarget as DisplayObject;
			tipTarget = null;
//			trace("rollout_" + disO.name);
		}

		/**
		 * 处理鼠标移入事件
		 */
		private static function onRollOver(event:MouseEvent):void
		{
			var disO:DisplayObject = event.currentTarget as DisplayObject;
			if (tipContainer == null)
			{
				tipContainer = disO.stage;
			}
			tipTarget = disO;
//			trace("rollover_" + disO.name);
		}

		/**
		 * 移除tip
		 * @param disO		注册tip的显示对象
		 */
		private static function removeTip(disO:DisplayObject):void
		{
			var toolTip:DisplayObject = getToolTip(disO);
			if (toolTip.parent != null)
			{
				toolTip.parent.removeChild(toolTip);
			}
		}

		/**
		 * 添加tip
		 * @param disO		注册tip的显示对象
		 */
		private static function addTip(disO:DisplayObject):void
		{
			var toolTip:DisplayObject = getToolTip(disO);
			IToolTip(toolTip).data = disODic[disO].data;

			if (toolTip.parent != tipContainer && tipContainer != null)
			{
				tipContainer.addChild(toolTip);
			}
		}

		/**
		 * 获取tip实例
		 * @param disO		注册tip的显示对象
		 * @return 			tip实例
		 */
		private static function getToolTip(disO:DisplayObject):DisplayObject
		{
			var cla:Class = disODic[disO].tipClas;
			if (cla == null)
			{
				cla = defaultCla;
			}
			if (tipDic[cla] == null)
			{
				tipDic[cla] = new cla();
			}
			return tipDic[cla];
		}

	}
}
