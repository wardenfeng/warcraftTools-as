package data
{
	import me.feng.utils.ArrayUtils;
	import me.feng3d.core.base.subgeometry.SubGeometry;
	import me.feng3d.vo.SubGeometryVO;

	/**
	 *
	 * @author feng 2015-11-20
	 */
	public class SubGeometryData
	{
		public function SubGeometryData()
		{
		}

		public static function getSubGeometryVO(subGeometry:SubGeometry):SubGeometryVO
		{
			var subGeometryVO:SubGeometryVO = new SubGeometryVO();
			subGeometryVO.indices = ArrayUtils.toArray(subGeometry.indices);
			subGeometryVO.vertices = ArrayUtils.toArray(subGeometry.vertexPositionData);
			subGeometryVO.uvs = ArrayUtils.toArray(subGeometry.UVData);

			return subGeometryVO;
		}
	}
}
