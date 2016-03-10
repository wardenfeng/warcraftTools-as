package me.feng3d.vo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import me.feng3d.vo.MaterialVO;
	import me.feng3d.vo.MeshVO;
	import me.feng3d.vo.AnimatorVO;
	import me.feng3d.vo.GeometryVO;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MeshVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GEOMETRY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.MeshVO.geometry", "geometry", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.GeometryVO; });

		private var geometry$field:me.feng3d.vo.GeometryVO;

		public function clearGeometry():void {
			geometry$field = null;
		}

		public function get hasGeometry():Boolean {
			return geometry$field != null;
		}

		public function set geometry(value:me.feng3d.vo.GeometryVO):void {
			geometry$field = value;
		}

		public function get geometry():me.feng3d.vo.GeometryVO {
			return geometry$field;
		}

		/**
		 *  @private
		 */
		public static const MATERIAL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.MeshVO.material", "material", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.MaterialVO; });

		private var material$field:me.feng3d.vo.MaterialVO;

		public function clearMaterial():void {
			material$field = null;
		}

		public function get hasMaterial():Boolean {
			return material$field != null;
		}

		public function set material(value:me.feng3d.vo.MaterialVO):void {
			material$field = value;
		}

		public function get material():me.feng3d.vo.MaterialVO {
			return material$field;
		}

		/**
		 *  @private
		 */
		public static const ANIMATOR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.MeshVO.animator", "animator", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.AnimatorVO; });

		private var animator$field:me.feng3d.vo.AnimatorVO;

		public function clearAnimator():void {
			animator$field = null;
		}

		public function get hasAnimator():Boolean {
			return animator$field != null;
		}

		public function set animator(value:me.feng3d.vo.AnimatorVO):void {
			animator$field = value;
		}

		public function get animator():me.feng3d.vo.AnimatorVO {
			return animator$field;
		}

		/**
		 *  @private
		 */
		public static const CHILDREN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.MeshVO.children", "children", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return MeshVO; });

		[ArrayElementType("MeshVO")]
		public var children:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGeometry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, geometry$field);
			}
			if (hasMaterial) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, material$field);
			}
			if (hasAnimator) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, animator$field);
			}
			for (var children$index:uint = 0; children$index < this.children.length; ++children$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.children[children$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var geometry$count:uint = 0;
			var material$count:uint = 0;
			var animator$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (geometry$count != 0) {
						throw new flash.errors.IOError('Bad data format: MeshVO.geometry cannot be set twice.');
					}
					++geometry$count;
					this.geometry = new me.feng3d.vo.GeometryVO();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.geometry);
					break;
				case 2:
					if (material$count != 0) {
						throw new flash.errors.IOError('Bad data format: MeshVO.material cannot be set twice.');
					}
					++material$count;
					this.material = new me.feng3d.vo.MaterialVO();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.material);
					break;
				case 3:
					if (animator$count != 0) {
						throw new flash.errors.IOError('Bad data format: MeshVO.animator cannot be set twice.');
					}
					++animator$count;
					this.animator = new me.feng3d.vo.AnimatorVO();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.animator);
					break;
				case 4:
					this.children.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new MeshVO()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
