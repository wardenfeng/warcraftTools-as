package data
{
	import flash.geom.Matrix3D;
	import flash.utils.ByteArray;

	import me.feng.utils.ArrayUtils;
	import me.feng3d.parsers.mdl.BoneObject;
	import me.feng3d.parsers.mdl.FBitmap;
	import me.feng3d.parsers.mdl.Geoset;
	import me.feng3d.parsers.mdl.Layer;
	import me.feng3d.parsers.mdl.Material;
	import me.feng3d.parsers.mdl.WarcraftModel;
	import me.feng3d.vo.AnimatorVO;
	import me.feng3d.vo.AnimatorVOType;
	import me.feng3d.vo.GeometryVO;
	import me.feng3d.vo.MaterialVO;
	import me.feng3d.vo.MeshVO;
	import me.feng3d.vo.SkeletonAnimationSetVO;
	import me.feng3d.vo.SkeletonAnimatorVO;
	import me.feng3d.vo.SkeletonJointVO;
	import me.feng3d.vo.SkeletonVO;
	import me.feng3d.vo.SubGeometryVO;

	/**
	 * 魔兽数据转换为feng3dVO数据
	 * @author feng 2015-11-22
	 */
	public class WarcraftToFeng3dVO
	{
		/**
		 * 获取模型网格
		 * @param time
		 * @return
		 */
		public static function getModelMesh(warcraftModel:WarcraftModel):MeshVO
		{
			var modelMesh:MeshVO = new MeshVO();
			for (var i:int = 0; i < warcraftModel.geosets.length; i++)
			{
				var mesh:MeshVO = getPartMeshVO(warcraftModel, i);
				modelMesh.children.push(mesh);
			}

			return modelMesh;
		}

		/**
		 * 获取部件网格
		 * @param warcraftModel
		 * @param i
		 * @return
		 */
		private static function getPartMeshVO(warcraftModel:WarcraftModel, i:int):MeshVO
		{
			var mesh:MeshVO = new MeshVO();

			mesh.geometry = getGeometry(warcraftModel.geosets[i]);
			mesh.material = getMaterial(warcraftModel, i);
			mesh.animator = getAnimator(warcraftModel);

			return mesh;
		}

		/**
		 * 获取动画
		 * @param warcraftModel
		 * @return
		 */
		private static function getAnimator(warcraftModel:WarcraftModel):AnimatorVO
		{
			var animatorVO:AnimatorVO = new AnimatorVO();

			animatorVO.type = AnimatorVOType.SKELETON_ANIMATOR;

			var skeletonAnimatorVO:SkeletonAnimatorVO = getSkeletonAnimator(warcraftModel);
			var animatorData:ByteArray = new ByteArray();
			skeletonAnimatorVO.writeTo(animatorData);
			animatorVO.animatorData = animatorData;

			return animatorVO;
		}

		/**
		 * 获取骨骼动画
		 * @param warcraftModel
		 * @return
		 */
		private static function getSkeletonAnimator(warcraftModel:WarcraftModel):SkeletonAnimatorVO
		{
			var skeletonAnimatorVO:SkeletonAnimatorVO = new SkeletonAnimatorVO();

			skeletonAnimatorVO.skeleton = getSkeleton(warcraftModel);

			skeletonAnimatorVO.skeletonAnimationSet = getSkeletonAnimationSet(warcraftModel);

			return skeletonAnimatorVO;
		}

		/**
		 * 获取骨骼动画集合
		 * @param warcraftModel
		 * @return
		 */
		private static function getSkeletonAnimationSet(warcraftModel:WarcraftModel):SkeletonAnimationSetVO
		{
			var skeletonAnimationSetVO:SkeletonAnimationSetVO = new SkeletonAnimationSetVO();

			skeletonAnimationSetVO.numJoints = warcraftModel.bones.length;

			skeletonAnimationSetVO.jointsPerVertex = getWarcraftModelJointsPerVertex(warcraftModel);

			return skeletonAnimationSetVO;
		}

		/**
		 * 获取魔兽模型每个顶点关联关节的数量
		 * @param warcraftModel
		 * @return
		 */
		private static function getWarcraftModelJointsPerVertex(warcraftModel:WarcraftModel):uint
		{
			var jointsPerVertex:int = 0;
			warcraftModel.geosets.forEach(function(geoset:Geoset, ... args):void
			{
				jointsPerVertex = Math.max(jointsPerVertex, getGeosetJointsPerVertex(geoset));
			});
			return jointsPerVertex;
		}

		/**
		 * 获取魔兽几何体每个顶点关联关节的数量
		 * @param geoset
		 * @return
		 */
		private static function getGeosetJointsPerVertex(geoset:Geoset):Number
		{
			var geosetJointsPerVertex:int = 0;
			geoset.Groups.forEach(function(item:Vector.<int>, ... args):void
			{
				geosetJointsPerVertex = Math.max(item.length);
			});
			return geosetJointsPerVertex;
		}

		/**
		 * 获取骨骼
		 * @param warcraftModel
		 * @return
		 */
		private static function getSkeleton(warcraftModel:WarcraftModel):SkeletonVO
		{
			var skeleton:SkeletonVO = new SkeletonVO();

			skeleton.joints = [];

			for (var i:int = 0; i < warcraftModel.bones.length; i++)
			{
				var skeletonJointVO:SkeletonJointVO = getSkeletonJointVO(warcraftModel.bones[i]);
				skeleton.joints.push(skeletonJointVO);
			}

			return skeleton;
		}

		/**
		 * 获取骨骼关节
		 * @param boneObject
		 * @return
		 */
		private static function getSkeletonJointVO(boneObject:BoneObject):SkeletonJointVO
		{
			var skeletonJointVO:SkeletonJointVO = new SkeletonJointVO();

			skeletonJointVO.name = boneObject.name;
			skeletonJointVO.parentIndex = boneObject.Parent;

			var matrix3D:Matrix3D = boneObject.calculateTransformation(0);
			skeletonJointVO.inverseBindPose = ArrayUtils.toArray(matrix3D.rawData);

			return skeletonJointVO;
		}

		/**
		 * 获取材质
		 * @param warcraftModel
		 * @param i
		 * @return
		 */
		private static function getMaterial(warcraftModel:WarcraftModel, i:int):MaterialVO
		{
			var materialVO:MaterialVO = new MaterialVO();

			var material:Material = warcraftModel.materials[warcraftModel.geosets[i].MaterialID];
			materialVO.imgPath = getFBitmap(material, warcraftModel.textures).image;

			return materialVO;
		}

		/**
		 * 获取贴图
		 * @param material
		 * @param textures
		 * @return
		 */
		public static function getFBitmap(material:Material, textures:Vector.<FBitmap>):FBitmap
		{
			var TextureID:int
			for each (var layer:Layer in material.layers)
			{
				TextureID = layer.TextureID;
				break;
			}

			var fBitmap:FBitmap = textures[TextureID];
			return fBitmap;
		}

		/**
		 * 获取几何体数据
		 * @param geoset
		 * @return
		 */
		private static function getGeometry(geoset:Geoset):GeometryVO
		{
			var geometry:GeometryVO = new GeometryVO();

			geometry.subGeometries = [];

			var subGeometry:SubGeometryVO = new SubGeometryVO();
			geometry.subGeometries.push(subGeometry);

			subGeometry.positions = ArrayUtils.toArray(geoset.Vertices);
			subGeometry.uvs = ArrayUtils.toArray(geoset.TVertices);
			subGeometry.indices = ArrayUtils.toArray(geoset.Faces);

			return geometry;
		}

	}
}
