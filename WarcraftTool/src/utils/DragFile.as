package utils
{
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeDragManager;
	import flash.display.InteractiveObject;
	import flash.events.NativeDragEvent;
	import flash.filesystem.File;
	import flash.utils.Dictionary;

	/**
	 * 拖入文件工具类
	 * @author feng 2015-11-13
	 */
	[Event(name = "dragDrop", type = "utils.DragDropEvent")]

	public class DragFile
	{
		private var registerDic:Dictionary;

		/**
		 * 创建拖入文件工具类
		 */
		public function DragFile()
		{
			registerDic = new Dictionary();
		}

		/**
		 * 注册交互对象拖入文件功能
		 * @param interactiveObject			交互对象
		 * @param filterFunc				过滤函数
		 */
		public function register(interactiveObject:InteractiveObject, filterFunc:Object):void
		{
			if (registerDic[interactiveObject])
			{
				unRegister(interactiveObject);
			}

			interactiveObject.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onNativeDragEnter);
			interactiveObject.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onNativeDragDrop);

			registerDic[interactiveObject] = filterFunc;
		}

		/**
		 * 注销交互对象拖入文件功能
		 * @param interactiveObject			交互对象
		 */
		public function unRegister(interactiveObject:InteractiveObject):void
		{
			interactiveObject.removeEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onNativeDragEnter);
			interactiveObject.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onNativeDragDrop);

			delete registerDic[interactiveObject];
		}

		/**
		 * 处理拖入事件
		 * @param event
		 */
		protected function onNativeDragEnter(event:NativeDragEvent):void
		{
			var interactiveObject:InteractiveObject = event.currentTarget as InteractiveObject;

			var filterArr:Array = getClipboardFiles(event.clipboard, registerDic[interactiveObject]);
			if (filterArr.length > 0)
			{
				NativeDragManager.acceptDragDrop(interactiveObject);
			}
		}

		/**
		 * 处理放入交互对象事件
		 * @param event
		 */
		protected function onNativeDragDrop(event:NativeDragEvent):void
		{
			var interactiveObject:InteractiveObject = event.currentTarget as InteractiveObject;
			var filterArr:Array = getClipboardFiles(event.clipboard, registerDic[interactiveObject]);

			interactiveObject.dispatchEvent(new DragDropEvent(DragDropEvent.DRAG_DROP, filterArr));
		}

		/**
		 * 剪切板中过滤获取文件列表
		 * @param clipboard				剪切板
		 * @param filterFunc			过滤函数
		 * @return
		 */
		private function getClipboardFiles(clipboard:Clipboard, filterFunc:Function):Array
		{
			var fileArr:Array = clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
			if (filterFunc != null)
			{
				fileArr = fileArr.filter(filterFunc);
			}
			return fileArr;
		}

		private static var _instance:DragFile;

		private static function get instance():DragFile
		{
			return _instance ||= new DragFile();
		}

		/**
		 * 注册交互对象拖入文件功能
		 * @param interactiveObject			交互对象
		 * @param filterFunc				过滤函数
		 */
		public static function register(interactiveObject:InteractiveObject, filterFunc:Object):void
		{
			instance.register(interactiveObject, filterFunc);
		}

		/**
		 * 注册交互对象拖入指定类型文件功能
		 * @param interactiveObject			交互对象
		 * @param acceptExtension			接收的扩展名，默认空(接收任意类型文件)
		 */
		public static function registerFilter(interactiveObject:InteractiveObject, ... acceptExtension):void
		{
			instance.register(interactiveObject, function(file:File, index:int, array:Array):Boolean
			{
				return acceptExtension == null || acceptExtension.indexOf(file.extension) != -1;
			});
		}

		/**
		 * 注销交互对象拖入文件功能
		 * @param interactiveObject			交互对象
		 */
		public static function unRegister(interactiveObject:InteractiveObject):void
		{
			instance.unRegister(interactiveObject);
		}
	}
}
