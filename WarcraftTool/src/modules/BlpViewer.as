package modules
{
	import com.bit101.components.VBox;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	import me.feng.events.FEvent;
	import me.feng.ui.tooltip.ToolTipManager;
	import me.feng3d.events.ParserEvent;
	import me.feng3d.parsers.BlpParser;

	import utils.DragDropEvent;
	import utils.DragFile;
	import utils.ShowBitmapView;

	/**
	 *
	 * @author feng 2015-11-10
	 */
	public class BlpViewer extends VBox
	{
		private var showBitmapView:ShowBitmapView;

		private var isInit:Boolean;

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

			showBitmapView = new ShowBitmapView();
			addChild(showBitmapView);
		}

		private function show():void
		{
			graphics.clear();
			graphics.beginFill(0x00ff00, 0.1);
			graphics.drawRect(0, 0, 400, 300);
			graphics.endFill();

			DragFile.registerFilter(this, "blp");
//			DragFile.register(this, filterFunc);
			ToolTipManager.register(this, {title: "拖入Blp贴图"});
		}

		private function close():void
		{
			showBitmapView.bitmap = null;

			DragFile.unRegister(this);
			ToolTipManager.unregister(this);
		}

		private function addListeners():void
		{
			addEventListener(DragDropEvent.DRAG_DROP, onDragDrop);
		}

		private function removeListeners():void
		{
			removeEventListener(DragDropEvent.DRAG_DROP, onDragDrop);
		}

		protected function onDragDrop(event:FEvent):void
		{
			ToolTipManager.unregister(this);

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
			myParser.customData = file;
			myParser.addEventListener(ParserEvent.PARSE_COMPLETE, onParseComplete);
			myParser.parseAsync(content);
		}

		private function onParseComplete(event:ParserEvent):void
		{
			var myParser:BlpParser = event.currentTarget as BlpParser;

			var bitmap:Bitmap = myParser.blpData.bitmap;

			showBitmapView.bitmap = bitmap;

			var byteArray:ByteArray = bitmapToByteArray(bitmap.bitmapData, new PNGEncoderOptions());

			var file:File = myParser.customData;
			var newFileName:String = file.name.replace("." + file.extension, ".png");
			var newFile:File = file.parent.resolvePath(newFileName);

			saveFile(byteArray, newFile);
		}

		private function saveFile(byteArray:ByteArray, newFile:File):void
		{
			var fileStream:FileStream = new FileStream();
			fileStream.open(newFile, FileMode.WRITE);
			fileStream.writeBytes(byteArray);
			fileStream.close();
		}

		private function bitmapToByteArray(bitmapData:BitmapData, compressor:Object, byteArray:ByteArray = null):ByteArray
		{
//			flash.display.PNGEncoderOptions()
			byteArray ||= new ByteArray();
//			bitmapData.encode(bitmapData.rect, new JPEGEncoderOptions(), byteArray);
			bitmapData.encode(bitmapData.rect, compressor, byteArray);
			return byteArray;
		}



	}
}



