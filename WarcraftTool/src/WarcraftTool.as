package
{
	import com.bit101.components.Style;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import me.feng.debug.DebugCommon;
	import me.feng.load.Load;
	import me.feng.task.Task;
	import me.feng3d.debug.Debug;

	import modules.BlpViewer;
	import modules.ModelTransitionView;
	import modules.PbMeshView;
	import modules.War3modelParse;

	import uk.co.soulwire.gui.SimpleGUI;

	import view.ViewCenter;

	/**
	 *
	 * @author feng 2015-11-9
	 */
	[SWF(width = "1024", height = "768", frameRate = "60", backgroundColor = "#999999")]
	public class WarcraftTool extends Sprite
	{
		public var viewCenter:ViewCenter;

		private var gui:SimpleGUI;

		public function WarcraftTool()
		{
			stage.frameRate = 60;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			init();
		}

		private function init():void
		{
			initStyles();

			Task.init();
			Load.init();

			MyCC.initFlashConsole(this);
			Debug.agalDebug = false;
			DebugCommon.loggerFunc = null;


			viewCenter = new ViewCenter(this);

			initView();
		}

		private function initView():void
		{
			gui = new SimpleGUI(this, "");

			viewCenter.viewClsDic["showBlpView"] = BlpViewer;
			viewCenter.viewClsDic["showMdlView"] = War3modelParse;
			viewCenter.viewClsDic["modelTransitionView"] = ModelTransitionView;
			viewCenter.viewClsDic["pbMeshView"] = PbMeshView;

			gui.addColumn("工具");
			gui.addToggle("viewCenter." + "showBlpView", {label: "显示blp贴图"});
			gui.addToggle("viewCenter." + "showMdlView", {label: "显示mdl模型动画"});
			gui.addToggle("viewCenter." + "modelTransitionView", {label: "模型转换"});
			gui.addToggle("viewCenter." + "pbMeshView", {label: "显示pbMesh"});

			gui.show();
		}

		//	----------------------------------------------------------------
		//	PRIVATE METHODS
		//	----------------------------------------------------------------
		private function initStyles():void
		{
			Style.setStyle(Style.DARK);

			Style.embedFonts = false;
			Style.fontSize = 12;

			Style.PANEL = 0x333333;
			Style.BACKGROUND = 0x333333;
			Style.INPUT_TEXT = 0xEEEEEE;
			Style.LABEL_TEXT = 0xEEEEEE;
			Style.BUTTON_FACE = 0x555555;
			Style.DROPSHADOW = 0x000000;
			Style.LIST_ALTERNATE = 0x333333;
		}
	}

}

