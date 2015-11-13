package utils
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * 
	 * @author feng 2015-11-13
	 */
	public class ShowBitmapView extends Sprite
	{
		private var _bitmap:Bitmap;
		
		public function ShowBitmapView()
		{
		}
		
		public function get bitmap():Bitmap
		{
			return _bitmap;
		}
		
		public function set bitmap(value:Bitmap):void
		{
			if (_bitmap != null)
			{
				removeChild(_bitmap);
			}
			
			_bitmap = value;
			
			if (_bitmap != null)
			{
				addChild(_bitmap);
			}
		}
	}
}