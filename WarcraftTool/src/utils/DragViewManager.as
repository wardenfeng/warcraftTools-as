package utils
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	/**
	 * 拖拽界面
	 * @author feng 2015-11-15
	 */
	public class DragViewManager
	{
		private var _stage:Stage;

		private var _dragTarget:Sprite;

		private var _dragViewDic:Dictionary;

		public function get dragViewDic():Dictionary
		{
			return _dragViewDic ||= new Dictionary();
		}

		public function register(interactiveObject:Sprite):void
		{
			stage ||= interactiveObject.stage;

			dragViewDic[interactiveObject] = true;
			interactiveObject.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}

		public function unRegister(interactiveObject:Sprite):void
		{
			delete dragViewDic[interactiveObject];
			interactiveObject.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}

		public function get stage():Stage
		{
			return _stage;
		}

		public function set stage(value:Stage):void
		{
			if (_stage != null)
			{
				stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				stage.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			}
			_stage = value;
			if (_stage != null)
			{
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				stage.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			}
		}

		public function get dragTarget():Sprite
		{
			return _dragTarget;
		}

		public function set dragTarget(value:Sprite):void
		{
			if (_dragTarget != null)
			{
				_dragTarget.stopDrag();
			}
			_dragTarget = value;
			if (_dragTarget != null)
			{
				_dragTarget.startDrag();
			}
		}

		protected function onMouseDown(event:MouseEvent):void
		{
			dragTarget = event.currentTarget as Sprite;
			stage ||= dragTarget.stage;
		}

		protected function onMouseUp(event:MouseEvent):void
		{
			dragTarget = null;
		}

		protected function onMouseOut(event:MouseEvent):void
		{
			if (event.currentTarget == dragTarget)
			{
				dragTarget = null;
			}
		}

		private static var _instance:DragViewManager;

		public static function get instance():DragViewManager
		{
			return _instance ||= new DragViewManager();
		}

		public static function register(interactiveObject:Sprite):void
		{
			instance.register(interactiveObject);
		}

		public static function unRegister(interactiveObject:Sprite):void
		{
			instance.unRegister(interactiveObject);
		}
	}
}
