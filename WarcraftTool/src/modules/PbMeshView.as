package modules
{

	import com.bit101.components.CheckBox;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.ScrollPane;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	import data.Feng3dVOToFeng3d;

	import me.feng.events.FEvent;
	import me.feng.ui.tooltip.ToolTipManager;
	import me.feng3d.containers.ObjectContainer3D;
	import me.feng3d.entities.Mesh;
	import me.feng3d.vo.MeshVO;

	import utils.DragDropEvent;
	import utils.DragFile;
	import utils.removeUI;

	import view.Environment3D;

	public class PbMeshView extends Sprite
	{
		public var obj3d:ObjectContainer3D;

		/** 网眼显示框 */
		private var meshPanel:Panel;

		private var meshShowCBList:Vector.<CheckBox> = new Vector.<CheckBox>();

		private var modelMesh:Mesh;

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

		private var environment3D:Environment3D;

		public function PbMeshView()
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
			if (isIniting)
				return;

			isIniting = true;

			initUI();

			init3D();
		}

		private function init3D():void
		{
			environment3D = new Environment3D();
			addChildAt(environment3D, 0);

			obj3d = new ObjectContainer3D();
			obj3d.name = "obj3d";
			obj3d.rotationX = -90;

			environment3D.view3d.scene.addChild(obj3d);

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
			var extension:String = "pbMesh";

			DragFile.registerFilter(this, extension);
			ToolTipManager.register(this, {title: "拖入" + extension + "模型"});

			addEventListeners();

			isShow = true;
		}

		private function close():void
		{
			if (!isShow)
				return;
			isShow = false;
			removeEventListeners();

			DragFile.unRegister(this);
			ToolTipManager.unregister(this);

			clear();
		}

		private function destroy():void
		{

		}

		private function addEventListeners():void
		{
			addEventListener(Event.ENTER_FRAME, enterFrame);

			addEventListener(DragDropEvent.DRAG_DROP, onDragDrop);
		}

		private function removeEventListeners():void
		{
			removeEventListener(Event.ENTER_FRAME, enterFrame);

			removeEventListener(DragDropEvent.DRAG_DROP, onDragDrop);
		}

		protected function onDragDrop(event:FEvent):void
		{
			ToolTipManager.unregister(this);

			var filterArr:Array = event.data;

			var fileStream:FileStream = new FileStream();
			fileStream.open(filterArr[0], FileMode.READ);

			var content:ByteArray = new ByteArray();
			fileStream.readBytes(content, 0, fileStream.bytesAvailable);

			initData(content);
		}

		private function initUI():void
		{
			meshPanel = new ScrollPane(this);
			new Label(meshPanel, 0, 0, "show mesh");
		}

		private function initData(myObjData:ByteArray):void
		{
			clear();

			var modelMeshVO:MeshVO = new MeshVO();
			modelMeshVO.mergeFrom(myObjData);

			modelMesh = Feng3dVOToFeng3d.toMesh(modelMeshVO);
			obj3d.addChild(modelMesh);

			meshShowCBList.length = modelMesh.numChildren;
			for (var i:int = 0; i < modelMesh.numChildren; i++)
			{
				var cb:CheckBox = new CheckBox(meshPanel, 5, 15 * i + 20, "mesh " + i);
				cb.selected = true;
				meshShowCBList[i] = cb;
			}
		}

		private function clear():void
		{
			obj3d.removeAllChild();

			meshShowCBList && meshShowCBList.forEach(function callback(item:*, index:int, array:*):void
			{
				removeUI(item);
			});
			meshShowCBList.length = 0;

			modelMesh = null;
		}

		private function enterFrame(e:Event):void
		{
			for (var i:int = 0; modelMesh != null && i < modelMesh.numChildren; i++)
			{
				modelMesh.getChildAt(i).visible = meshShowCBList[i].selected;
			}
			obj3d.rotationY++;
		}

	} // end of class
} // end of package
