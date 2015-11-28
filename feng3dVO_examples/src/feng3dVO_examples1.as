package
{
	import flash.display.Sprite;
	import flash.utils.ByteArray;

	import me.feng3d.vo.SubGeometryVO;

	/**
	 * 测试数据序列反序列化(奇怪的测试，writeDelimitedTo与mergeFrom)
	 * @author feng 2015-11-21
	 */
	public class feng3dVO_examples1 extends Sprite
	{
		public function feng3dVO_examples1()
		{
			var arr:Array = [0, 1];

			var index:int = 0;

			while (arr[index] < 1000000)
			{
				index = (index + 1) % 2;

				arr[index] = arr[0] + arr[1];

				testNum(arr[index]);
				trace("ok", arr[index]);
			}
			trace("end!");
		}

		public function next(index:int, nextNum:int, max:int):int
		{
			return (index + nextNum) % max;
		}

		public function testNum(index:int):void
		{
			var byteArray:ByteArray = new ByteArray();
//			byteArray.endian = Endian.LITTLE_ENDIAN;

			var subG:SubGeometryVO = new SubGeometryVO();
			subG.uvs = [1, 2.1, 2.5];
			subG.vertices = [];

			for (var i:int = 0; i < index; i++)
			{
				subG.vertices.push(Math.random());
			}

			subG.writeDelimitedTo(byteArray);

			byteArray.position = 0;
			var len:int;

			var lens:Array = [];
			var num:int = byteArray.length
			do
			{
				lens.push(byteArray.readUnsignedByte());
				num = num >> 7;
			} while (num > 0)

			var length:int = getLength(lens);
			assert(length == byteArray.length);

			var bytes:ByteArray = new ByteArray();
			bytes.writeObject(subG);

			var subG1:SubGeometryVO = new SubGeometryVO();
			subG1.mergeFrom(byteArray);

			assert(test(subG.vertices, subG1.vertices));
		}

		private function getLength(lens:Array):int
		{
			var value:int = 0;

			for (var i:int = lens.length - 1; i > 0; i--)
			{
				value = (value + lens[i] - 1) << 7;
			}
			value = value + lens[0] + lens.length;

			return value;
		}

		private function test(vertices:Array, vertices1:Array):Boolean
		{
			assert(vertices.length == vertices1.length);

			for (var i:int = 0; i < vertices.length; i++)
			{
				assert(vertices[i] - vertices1[i] < 0.0000001);
			}
			return true;
		}

		private function assert(param0:Boolean):void
		{
			if (!param0)
				throw new Error();
		}
	}
}
