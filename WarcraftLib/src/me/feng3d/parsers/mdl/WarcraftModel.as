package me.feng3d.parsers.mdl
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	/**
	 * 魔兽模型数据
	 * @author warden_feng 2014-6-28
	 */
	public class WarcraftModel
	{
		/** 版本号 */
		public var version:int;
		/** 模型数据统计结果 */
		public var model:Model;
		/** 动作序列 */
		public var sequences:Vector.<AnimInfo>;
		/** 全局序列 */
		public var globalsequences:Globalsequences;
		/** 纹理列表 */
		public var textures:Vector.<FBitmap>;
		/** 材质列表 */
		public var materials:Vector.<Material>;
		/** 几何设置列表 */
		public var geosets:Vector.<Geoset>;
		/** 几何动画列表 */
		public var geosetAnims:Vector.<GeosetAnim>;
		/** 骨骼动画列表 */
		public var bones:Vector.<BoneObject>;
		/** 骨骼轴心坐标 */
		public var pivotPoints:Vector.<Vector3D>;

		//-------------------------------------
		//
		//	以下数据计算得出
		//
		//---------------------------------------

		/** 顶点最大关节关联数 */
		public var _maxJointCount:int;

		public function WarcraftModel()
		{
		}

		private function BuildAnimatedMesh(m_animTime:int, geoset:Geoset):Vector.<Number>
		{
			var positions:Vector.<Number> = geoset.Vertices.concat();

			var numVertexs:int = geoset.Vertices.length / 3;
			for (var i:int = 0; i < numVertexs; i++)
			{
				var animatedPos:Vector3D = new Vector3D();

				//原顶点数据
				var vPosOri:Vector3D = new Vector3D(positions[i * 3], positions[i * 3 + 1], positions[i * 3 + 2]);
				//顶点所在组索引
				var iGroupIndex:int = geoset.VertexGroup[i];
				//顶点所在组索引
				var group:Vector.<int> = geoset.Groups[iGroupIndex];
				//顶点关联骨骼数量
				var numBones:int = group.length;
				for (var j:int = 0; j < numBones; j++)
				{
					var boneIndex:int = group[j];
					var bone:BoneObject = bones[boneIndex];
					var transformation:Matrix3D = bone.c_globalTransformation;

					var tempPos:Vector3D = transformation.transformVector(vPosOri);
					animatedPos = animatedPos.add(tempPos);
				}

				animatedPos.scaleBy(1 / numBones);

				positions[i * 3] = animatedPos.x;
				positions[i * 3 + 1] = animatedPos.y;
				positions[i * 3 + 2] = animatedPos.z;
			}

			return positions;
		}

		private function UpdateAllNodeMatrix(m_animTime:int):void
		{
			var numNodes:int = bones.length;
			var i:int;
			var bone:BoneObject;

			for (i = 0; i < numNodes; i++)
			{
				bone = bones[i];
				bone.pivotPoint = pivotPoints[bone.ObjectId];
				bone.c_globalTransformation = null;
			}

			for (i = 0; i < numNodes; i++)
			{
				bone = bones[i];
				BuildMatrix(bone, m_animTime);
			}
		}

		private function BuildMatrix(bone:BoneObject, m_animTime:int):void
		{
			var globalTransformation:Matrix3D = bone.c_globalTransformation;
			if (globalTransformation == null)
			{
				var localTransformation:Matrix3D = bone.calculateTransformation(m_animTime);
				if (bone.Parent == -1)
				{
					globalTransformation = localTransformation;
				}
				else
				{
					var parentBone:BoneObject = bones[bone.Parent];
					BuildMatrix(parentBone, m_animTime);
					var parentGlobalTransformation:Matrix3D = parentBone.c_globalTransformation;
					globalTransformation = parentGlobalTransformation.clone();
					globalTransformation.prepend(localTransformation);
				}
				bone.c_globalTransformation = globalTransformation;
			}
		}

	}
}
