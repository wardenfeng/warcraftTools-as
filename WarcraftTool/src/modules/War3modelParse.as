package modules
{

	import com.bit101.components.CheckBox;
	import com.bit101.components.ComboBox;
	import com.bit101.components.Label;
	import com.bit101.components.ScrollPane;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;

	import data.Feng3dVOToFeng3d;
	import data.WarcraftToFeng3dVO;

	import me.feng.events.FEvent;
	import me.feng.ui.tooltip.ToolTipManager;
	import me.feng3d.containers.ObjectContainer3D;
	import me.feng3d.entities.Mesh;
	import me.feng3d.parsers.MdlParser;
	import me.feng3d.parsers.mdl.AnimInfo;
	import me.feng3d.parsers.mdl.WarcraftModel;
	import me.feng3d.vo.MeshVO;

	import utils.DragDropEvent;
	import utils.DragFile;
	import utils.removeUI;

	import view.Environment3D;

	public class War3modelParse extends Sprite
	{
		public var obj3d:ObjectContainer3D;

		private var myParser:MdlParser;
		private var war3Model:WarcraftModel;

		/** 动画下拉框 */
		private var actionCB:ComboBox

		/** 网眼显示框 */
		private var meshPanel:ScrollPane;

		private var meshShowCBList:Vector.<CheckBox> = new Vector.<CheckBox>();
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

		private var modelMesh:Mesh;

		public function War3modelParse()
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

			DragFile.registerFilter(this, "mdl");
			ToolTipManager.register(this, {title: "拖入mdl模型"});

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
			actionCB = new ComboBox(this, meshPanel.width);
			new Label(meshPanel, 0, 0, "show mesh");
		}

		private function initData(myObjData:ByteArray):void
		{
			clear();

			myParser = new MdlParser(myObjData);
			war3Model = myParser.parse();

			var items:Array = [];
			for each (var animInfo:AnimInfo in war3Model.sequences)
			{
				items.push({label: animInfo.name, start: animInfo.interval.start, end: animInfo.interval.end});
			}

			actionCB.items = items;
			actionCB.selectedIndex = 0;

			var meshs:MeshVO = WarcraftToFeng3dVO.getModelMesh(war3Model);

			modelMesh = Feng3dVOToFeng3d.toMesh(meshs);
			obj3d.addChild(modelMesh);

			meshShowCBList.length = modelMesh.numChildren;
			for (var i:int = 0; i < modelMesh.numChildren; i++)
			{
				var cb:CheckBox = new CheckBox(meshPanel, 5, 15 * i + 20, "mesh " + i);
				cb.selected = true;
				meshShowCBList[i] = cb;
			}

			saveObject(meshs);
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

		private function saveObject(meshs:Object):void
		{
			var str:String = JSON.stringify(meshs);

			var file:File = File.desktopDirectory.resolvePath("mesh.json");

			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeUTFBytes(str);
			fileStream.close();
		}

		private function enterFrame(e:Event):void
		{
			var time:int = getTimer();

			var item:Object = actionCB.selectedItem;

			if (item != null)
			{
//				var meshtime:int = (time % (item.end - item.start)) + item.start;
//				var meshs:Vector.<Mesh1> = war3Model.getMesh(meshtime);
//
				for (var i:int = 0; modelMesh != null && i < modelMesh.numChildren; i++)
				{
					modelMesh.getChildAt(i).visible = meshShowCBList[i].selected;
//
//					var subGeo:SubGeometry = meshItem.geometry.subGeometries[0];
//
//					var myMesh:Mesh1 = meshs[i];
//					subGeo.updateIndexData(myMesh.indexs);
//					subGeo.updateVertexPositionData(myMesh.positions);
//					subGeo.updateUVData(myMesh.uvs);
				}
			}
			obj3d.rotationY++;
		}

	} // end of class
} // end of package
