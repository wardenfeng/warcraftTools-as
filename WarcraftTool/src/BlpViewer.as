package
{
	import com.bit101.components.VBox;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import fla.ui.BlpViewerBackUI;
	
	import me.feng.events.FEvent;
	import me.feng3d.events.ParserEvent;
	import me.feng3d.parsers.BlpParser;
	
	import utils.DragMask;
	import utils.ShowBitmapView;

	/**
	 *
	 * @author feng 2015-11-10
	 */
	public class BlpViewer extends VBox
	{
		private var showBitmapView:ShowBitmapView;

		private var isInit:Boolean;

		private var dragMask:DragMask;
		
		private var blpViewerBack:Sprite;

		public function BlpViewer()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}

		protected function onAddedToStage(event:Event):void
		{
			init();
			show();
			addListeners();
		}

		protected function onRemovedFromStage(event:Event):void
		{
			removeListeners();
			close();
		}

		private function init():void
		{
			if (isInit)
				return;
			isInit = true;

			blpViewerBack = new BlpViewerBackUI();
			addChild(blpViewerBack);
			
			showBitmapView = new ShowBitmapView();
			blpViewerBack.addChild(showBitmapView);
			
			dragMask = new DragMask();
			dragMask.filterFunc = filterFunc;
		}

		private function show():void
		{
			blpViewerBack.addChildAt(dragMask, 0);
		}

		private function close():void
		{
			if (dragMask.parent != null)
			{
				dragMask.parent.removeChild(dragMask);
			}
			
			showBitmapView.bitmap = null;
		}

		private function addListeners():void
		{
			dragMask.addEventListener("dragDrop", onDragDrop);
		}

		private function removeListeners():void
		{
			dragMask.removeEventListener("dragDrop", onDragDrop);
		}

		protected function onDragDrop(event:FEvent):void
		{
			var filterArr:Array = event.data;
			showBlp(filterArr[0]);
		}

		private function filterFunc(file:File, index:int, array:Array):Boolean
		{
			return file.extension == "blp";
		}

		private function showBlp(file:File):void
		{
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.READ);

			var content:ByteArray = new ByteArray();
			fileStream.readBytes(content, 0, fileStream.bytesAvailable);

			var myParser:BlpParser = new BlpParser();
			myParser.addEventListener(ParserEvent.PARSE_COMPLETE, onParseComplete);
			myParser.parseAsync(content);
		}

		private function onParseComplete(event:ParserEvent):void
		{
			var myParser:BlpParser = event.currentTarget as BlpParser;

			showBitmapView.bitmap = myParser.blpData.bitmap;
		}
	}
}



