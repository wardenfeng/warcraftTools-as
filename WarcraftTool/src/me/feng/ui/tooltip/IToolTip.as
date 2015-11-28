package me.feng.ui.tooltip
{

	/**
	 * 提示框 接口
	 * @author warden_feng 2015-2-8
	 */
	public interface IToolTip
	{
		/**
		 * 提示数据
		 */
		function set data(value:Object):void;

		/**
		 * 更新tip位置
		 */
		function updatePosition():void;
	}
}
