package utils
{
	import me.feng.events.FEvent;
	
	/**
	 * 
	 * @author feng 2015-11-13
	 */
	public class DragDropEvent extends FEvent
	{
		public static const DRAG_DROP:String = "dragDrop";
		
		public function DragDropEvent(type:String, data:* = null)
		{
			super(type, data);
		}
	}
}