package utils
{
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeDragManager;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.NativeDragEvent;
	
	import me.feng.events.FEvent;

	/**
	 *
	 * @author feng 2015-11-13
	 */
	[Event(name = "dragDrop", type = "utils.DragDropEvent")]

	public class DragMask extends Sprite
	{
		public var filterFunc:Function;
		private var _displayObject:Sprite;
		private var parentTemp:DisplayObjectContainer;
		private var backcolor:uint;
		private var backalpha:Number;

		public function DragMask(backcolor:uint = 0xcccccc,backalpha:Number=0.2)
		{
			this.backcolor = backcolor;
			this.backalpha = alpha;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}

		protected function onAddedToStage(event:Event):void
		{
			parentTemp = parent;

			updateBack();
			addListeners();
		}

		protected function onRemovedFromStage(event:Event):void
		{
			removeListeners();
			parentTemp = null;
		}

		protected function onReSize(event:Event):void
		{
			updateBack();
		}

		private function updateBack():void
		{
			var width:Number = parentTemp is Stage ? Stage(parentTemp).stageWidth : parentTemp.width;
			var height:Number = parentTemp is Stage ? Stage(parentTemp).stageHeight : parentTemp.height;

			graphics.clear();
			graphics.beginFill(backcolor, backalpha);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}

		private function addListeners():void
		{
			parentTemp.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onNativeDragEnter);
			parentTemp.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onNativeDragDrop);

			parentTemp.addEventListener(Event.RESIZE, onReSize);
		}

		private function removeListeners():void
		{
			parentTemp.removeEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onNativeDragEnter);
			parentTemp.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onNativeDragDrop);

			parentTemp.removeEventListener(Event.RESIZE, onReSize);
		}

		protected function onNativeDragEnter(event:NativeDragEvent):void
		{
			var filterArr:Array = getClipboardFiles(event.clipboard);
			if (filterArr.length > 0)
			{
				NativeDragManager.acceptDragDrop(parentTemp);
			}
		}

		protected function onNativeDragDrop(event:NativeDragEvent):void
		{
			var filterArr:Array = getClipboardFiles(event.clipboard);

			dispatchEvent(new FEvent("dragDrop", filterArr));
		}

		private function getClipboardFiles(clipboard:Clipboard):Array
		{
			var fileArr:Array = clipboard.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
			if (filterFunc != null)
			{
				fileArr = fileArr.filter(filterFunc);
			}
			return fileArr;
		}
	}
}
