package data
{
	import me.feng.utils.ArrayUtils;
	import me.feng3d.animators.IAnimator;
	import me.feng3d.animators.skeleton.SkeletonAnimationSet;
	import me.feng3d.animators.skeleton.SkeletonAnimator;
	import me.feng3d.animators.skeleton.data.Skeleton;
	import me.feng3d.animators.skeleton.data.SkeletonJoint;
	import me.feng3d.core.base.Geometry;
	import me.feng3d.core.base.subgeometry.SubGeometry;
	import me.feng3d.entities.Mesh;
	import me.feng3d.materials.MaterialBase;
	import me.feng3d.materials.TextureMaterial;
	import me.feng3d.utils.MaterialUtils;
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
	 * feng3dVO数据转换为feng3d对象
	 * @author feng 2015-11-22
	 */
	public class Feng3dVOToFeng3d
	{
		/**
		 * 转换为网格
		 * @param meshVO
		 * @return
		 */
		public static function toMesh(meshVO:MeshVO):Mesh
		{
			var mesh:Mesh = new Mesh();

			mesh.geometry = toGeometry(meshVO.geometry);
			mesh.material = toMaterial(meshVO.material);
			mesh.animator = toAnimator(meshVO.animator);

			for (var i:int = 0; i < meshVO.children.length; i++)
			{
				mesh.addChild(toMesh(meshVO.children[i]));
			}

			return mesh;
		}

		/**
		 * 转换为材质
		 * @param materialVO
		 * @return
		 */
		private static function toMaterial(materialVO:MaterialVO):MaterialBase
		{
			if (materialVO == null)
				return null;

			var image:String = materialVO.imgPath;
			image = image.substring(0, image.indexOf("."));
			while (image.indexOf("\\") != -1)
			{
				image = image.replace("\\", "_");
			}
			image = "war3/" + image + ".JPG";

			var material:TextureMaterial = MaterialUtils.createTextureMaterial(image);

			return material;
		}

		/**
		 * 转换为几何体
		 * @param geometryVO
		 * @return
		 */
		private static function toGeometry(geometryVO:GeometryVO):Geometry
		{
			if (geometryVO == null)
				return new Geometry();

			var geometry:Geometry = new Geometry();

			for (var i:int = 0; i < geometryVO.subGeometries.length; i++)
			{
				geometry.addSubGeometry(toSubGeometry(geometryVO.subGeometries[i]));
			}

			return geometry;
		}

		/**
		 * 转换为子几何体
		 * @param subGeometryVO
		 * @return
		 */
		private static function toSubGeometry(subGeometryVO:SubGeometryVO):SubGeometry
		{
			var subGeometry:SubGeometry = new SubGeometry();

			subGeometry.numVertices = subGeometryVO.positions.length / 3;

			subGeometry.updateIndexData(ArrayUtils.toArray(subGeometryVO.indices, null, Vector.<uint>));
			subGeometry.updateVertexPositionData(ArrayUtils.toArray(subGeometryVO.positions, null, Vector.<Number>));
			subGeometry.updateUVData(ArrayUtils.toArray(subGeometryVO.uvs, null, Vector.<Number>));

			return subGeometry;
		}

		/**
		 * 转换为动画
		 * @param animator
		 * @return
		 */
		private static function toAnimator(animatorVO:AnimatorVO):IAnimator
		{
			var animator:IAnimator = null;
			try
			{
				animator = $toAnimator(animatorVO);
			}
			catch (error:Error)
			{
				trace(error.getStackTrace());
			}
			return animator;
		}

		/**
		 * 转换为动画
		 * @param animator
		 * @return
		 */
		private static function $toAnimator(animatorVO:AnimatorVO):IAnimator
		{
			var animator:IAnimator;
			switch (animatorVO.type)
			{
				case AnimatorVOType.SKELETON_ANIMATOR:
					var skeletonAnimatorVO:SkeletonAnimatorVO = new SkeletonAnimatorVO();
					skeletonAnimatorVO.mergeFrom(animatorVO.animatorData);
					animator = toSkeletonAnimator(skeletonAnimatorVO);
					break;
				default:
					throw new Error("未知动画类型：" + animatorVO.type);
					break;
			}

			return animator;
		}

		/**
		 * 转换为骨骼动画
		 * @param skeletonAnimatorVO
		 * @return
		 */
		private static function toSkeletonAnimator(skeletonAnimatorVO:SkeletonAnimatorVO):IAnimator
		{
			var skeletonAnimator:SkeletonAnimator = null;
			try
			{
				var animationSet:SkeletonAnimationSet = toSkeletonAnimationSet(skeletonAnimatorVO.skeletonAnimationSet);
				var skeleton:Skeleton = toSkeleton(skeletonAnimatorVO.skeleton);
				var forceCPU:Boolean = false;

				skeletonAnimator = new SkeletonAnimator(animationSet, skeleton, forceCPU);
			}
			catch (error:Error)
			{
				trace(error.getStackTrace());
			}
			return skeletonAnimator;
		}

		/**
		 * 转换为骨骼
		 * @param skeleton
		 * @return
		 */
		private static function toSkeleton(skeletonVO:SkeletonVO):Skeleton
		{
			var skeleton:Skeleton = new Skeleton();

			for (var i:int = 0; i < skeletonVO.joints.length; i++)
			{
				var joint:SkeletonJoint = toSkeletonJoint(skeletonVO.joints[i]);
				skeleton.joints.push(joint);

			}

			skeletonVO.joints.length

			return skeleton;
		}

		/**
		 * 转换为骨骼关节
		 * @param param0
		 * @return
		 */
		private static function toSkeletonJoint(skeletonJointVO:SkeletonJointVO):SkeletonJoint
		{
			var skeletonJoint:SkeletonJoint = new SkeletonJoint();
			skeletonJoint.parentIndex = skeletonJointVO.parentIndex;
			skeletonJoint.name = skeletonJointVO.name;
			skeletonJoint.inverseBindPose = ArrayUtils.toArray(skeletonJointVO.inverseBindPose, null, Vector.<Number>);
			return skeletonJoint;
		}

		/**
		 * 转换为骨骼动画集合
		 * @param skeletonAnimationSet
		 * @return
		 */
		private static function toSkeletonAnimationSet(skeletonAnimationSetVO:SkeletonAnimationSetVO):SkeletonAnimationSet
		{
			var skeletonAnimationSet:SkeletonAnimationSet = new SkeletonAnimationSet(skeletonAnimationSetVO.jointsPerVertex);
			skeletonAnimationSet.numJoints = skeletonAnimationSetVO.numJoints;
			return skeletonAnimationSet;
		}
	}
}
