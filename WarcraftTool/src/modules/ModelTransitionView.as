package modules
{
	import flash.display.Sprite;
	import flash.events.Event;

	import me.feng.events.FEvent;
	import me.feng.task.TaskEvent;
	import me.feng.task.type.TaskList;
	import me.feng.ui.tooltip.ToolTipManager;

	import utils.DragDropEvent;
	import utils.DragFile;

	/**
	 * 模型转换界面
	 * @author feng 2015-11-22
	 */
	public class ModelTransitionView extends Sprite
	{
		/**
		 * 是否初始化
		 */
		private var isInit:Boolean;

		/**
		 * 是否显示
		 */
		private var isShow:Boolean;

		public function ModelTransitionView()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromeStage);
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
			graphics.clear();
			graphics.beginFill(0xffffff, 0.1);
			graphics.drawRect(0, 0, 800, 600);
			graphics.endFill();

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

			DragFile.registerFilter(this, "mdl");
			ToolTipManager.register(this, {title: "拖入mdl模型"});

			isShow = true;

			addListeners();
		}

		private function close():void
		{
			if (!isShow)
				return;
			isShow = false;

			DragFile.unRegister(this);
			ToolTipManager.unregister(this);

			removeListeners();
		}

		private function destroy():void
		{

		}

		private function addListeners():void
		{
			addEventListener(DragDropEvent.DRAG_DROP, onDragDrop);
		}

		private function removeListeners():void
		{
			removeEventListener(DragDropEvent.DRAG_DROP, onDragDrop);
		}

		public function onDragDrop(event:FEvent):void
		{
			ToolTipManager.register(this, {title: "正在解析mdl模型"});

			var files:Array = event.data;

			var taskList:TaskList = new TaskList();
			taskList.addEventListener(TaskEvent.COMPLETED, onCompleted);
			taskList.addEventListener(TaskEvent.COMPLETEDITEM, onCompletedItem);
			for (var i:int = 0; i < files.length; i++)
			{
				//添加 单击任务
				taskList.addItem(new MdlParserTask(files[i]));
			}
			taskList.execute();
		}

		protected function onCompletedItem(event:TaskEvent):void
		{

		}

		protected function onCompleted(event:TaskEvent):void
		{
			ToolTipManager.register(this, {title: "拖入mdl模型"});
		}
	}
}

import flash.filesystem.File;
import flash.utils.ByteArray;

import data.WarcraftToFeng3dVO;

import me.feng.task.TaskItem;
import me.feng3d.parsers.MdlParser;
import me.feng3d.parsers.mdl.WarcraftModel;
import me.feng3d.vo.MeshVO;

import utils.FileUtils;

class MdlParserTask extends TaskItem
{
	private var file:File;

	public function MdlParserTask(file:File)
	{
		this.file = file;
	}

	override public function execute(params:* = null):void
	{
		super.execute(params);

		var rootPath:String = file.parent.nativePath;
		var fileName:String = file.name.substring(0, file.name.indexOf("."));

		var content:ByteArray = FileUtils.readByteArray(file);

		var myParser:MdlParser = new MdlParser(content);
		var war3Model:WarcraftModel = myParser.parse();

		var modelMeshVO:MeshVO = WarcraftToFeng3dVO.getModelMesh(war3Model);

		FileUtils.saveJson(modelMeshVO, rootPath + "\\" + fileName + ".json");
		FileUtils.saveProtobuf(modelMeshVO, rootPath + "\\" + fileName + ".pbMesh");

		file = null;

		doComplete();
	}
}
