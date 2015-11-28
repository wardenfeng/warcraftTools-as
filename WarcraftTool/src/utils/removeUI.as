package utils
{
	import flash.display.DisplayObject;

	/**
	 * 移除ui
	 * @author feng 2015-11-17
	 */
	public function removeUI(diso:DisplayObject):void
	{
		if (diso != null && diso.parent != null)
		{
			diso.parent.removeChild(diso);
		}
	}
}
