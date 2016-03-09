package
{
	import flash.display.Sprite;
	import flash.utils.ByteArray;

	import me.feng3d.vo.SubGeometryVO;

	/**
	 * 测试数据序列反序列化
	 * @author feng 2015-11-21
	 */
	public class feng3dVO_examples extends Sprite
	{
		public function feng3dVO_examples()
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

		public function testNum(index:int):void
		{
			var byteArray:ByteArray = new ByteArray();

			var subG:SubGeometryVO = new SubGeometryVO();
			subG.uvs = [1, 2.1, 2.5];
			subG.indices = [];

			for (var i:int = 0; i < index; i++)
			{
				subG.positions.push(Math.random());
			}

			subG.writeTo(byteArray);

			byteArray.position = 0;
			var subG1:SubGeometryVO = new SubGeometryVO();
			subG1.mergeFrom(byteArray);

			assert(test(subG.uvs, subG1.uvs));
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


