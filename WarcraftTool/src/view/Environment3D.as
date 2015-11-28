package view
{
	import com.bit101.components.ColorChooser;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;

	import me.feng3d.configs.Context3DBufferIDConfig;
	import me.feng3d.containers.View3D;
	import me.feng3d.debug.Trident;
	import me.feng3d.fagalRE.FagalRE;

	/**
	 *
	 * @author feng 2015-11-17
	 */
	public class Environment3D extends Sprite
	{
		/**
		 * 是否在初始化过程中
		 */
		private var isIniting:Boolean;
		/**
		 * 是否初始化
		 */
		private var isInit:Boolean;
		/**
		 * 是否显示
		 */
		private var isShow:Boolean;

		public var view3d:View3D;

		private var _backColor:uint = 0xffffff;

		public function Environment3D()
		{
			//配置3d缓存编号
			FagalRE.addBufferID(Context3DBufferIDConfig.bufferIdConfigs);

			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromeStage);
		}

		protected function get backColor():uint
		{
			return _backColor;
		}

		protected function set backColor(value:uint):void
		{
			_backColor = value;
			if (view3d != null)
			{
				view3d.backgroundColor = _backColor;
			}
		}

		protected function onAddToStage(event:Event):void
		{
			show();
		}

		protected function onRemoveFromeStage(event:Event):void
		{
			close();
		}

		private function init():void
		{
			if (isIniting)
				return;

			isIniting = true;

			initUI();

			init3D();
		}

		private function initUI():void
		{
			new ColorChooser(this, 300, 0, backColor, onChange);
		}

		protected function onChange(event:Event):void
		{
			var colorChooser:ColorChooser = event.currentTarget as ColorChooser;
			backColor = colorChooser.value;
		}

		private function init3D():void
		{
			view3d = new View3D();
			view3d.backgroundColor = backColor;
			addChildAt(view3d, 0);

			view3d.camera.z = -400;
			view3d.camera.y = 100;
			view3d.camera.x = 0;
			view3d.camera.lookAt(new Vector3D());

			view3d.scene.addChild(new Trident());

			isInit = true;
			show();
		}

		private function show():void
		{
			if (!isInit)
			{
				init();
				return;
			}

			if (isShow)
				return;

			addEventListeners();

			isShow = true;
		}

		private function close():void
		{
			if (!isShow)
				return;
			isShow = false;
			removeEventListeners();
		}

		private function addEventListeners():void
		{
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}

		private function removeEventListeners():void
		{
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}

		protected function enterFrame(event:Event):void
		{
			view3d.render();
		}
	}
}
