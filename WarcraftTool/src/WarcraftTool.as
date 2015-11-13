package
{
	import com.bit101.components.CheckBox;
	import com.bit101.components.HBox;
	import com.bit101.components.Style;
	import com.bit101.components.VBox;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;

	/**
	 *
	 * @author feng 2015-11-9
	 */
	[SWF(width = "640", height = "362", frameRate = "60", backgroundColor = "#999999")]
	public class WarcraftTool extends Sprite
	{
		private var _blpView:BlpViewer;
		private var leftView:VBox;
		private var rightView:VBox;

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
			
			var hbox:HBox = new HBox(this);
			
			leftView = new VBox(hbox);

			new CheckBox(leftView, 0, 0, "显示blp贴图", onShowBlp);

			rightView = new VBox(hbox);
		}

		private function onShowBlp(event:MouseEvent):void
		{
			var b:CheckBox = event.currentTarget as CheckBox;

			if (b.selected)
			{
				rightView.addChild(blpView);
			}
			else
			{
				rightView.removeChild(blpView);
			}
		}

		private function get blpView():BlpViewer
		{
			return _blpView ||= new BlpViewer();
		}
		
		//	----------------------------------------------------------------
		//	PRIVATE METHODS
		//	----------------------------------------------------------------
		private function initStyles() : void
		{
			Style.embedFonts = false;
			Style.fontSize = 12;
			Style.PANEL = 0x333333;
			Style.BACKGROUND = 0x333333;
			Style.INPUT_TEXT = 0xEEEEEE;
			Style.LABEL_TEXT = 0xEEEEEE;
			Style.BUTTON_FACE = 0x555555;
			Style.DROPSHADOW = 0x000000;
		}
	}
	
}

