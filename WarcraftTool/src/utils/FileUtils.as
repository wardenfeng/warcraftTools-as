package utils
{
	import com.netease.protobuf.Message;

	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	/**
	 *
	 * @author feng 2015-11-22
	 */
	public class FileUtils
	{
		public function FileUtils()
		{
		}

		/**
		 * 保存json字符串到文件
		 * @param obj				需要保存的对象
		 * @param savePath			保存路径
		 */
		public static function saveJson(obj:Object, savePath:String):void
		{
			var str:String = JSON.stringify(obj);

			var file:File = new File(savePath);

			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeUTFBytes(str);
			fileStream.close();
		}

		/**
		 * 保存protobuf数据到文件
		 * @param message			需要保存的信息
		 * @param savePath			保存路径
		 */
		public static function saveProtobuf(message:Message, savePath:String):void
		{
			var bytes:ByteArray = new ByteArray();
			message.writeTo(bytes);
			saveByteArray(bytes, savePath);
		}

		/**
		 * 保存二进制到文件
		 * @param bytes				需要保存的二进制
		 * @param savePath			保存路径
		 */
		public static function saveByteArray(bytes:ByteArray, savePath:String):void
		{
			var file:File = new File(savePath);

			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeBytes(bytes);
			fileStream.close();
		}

		/**
		 * 读取二进制数据
		 * @param file
		 * @return
		 */
		public static function readByteArray(file:File):ByteArray
		{
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.READ);

			var content:ByteArray = new ByteArray();
			fileStream.readBytes(content, 0, fileStream.bytesAvailable);
			return content;
		}
	}
}
