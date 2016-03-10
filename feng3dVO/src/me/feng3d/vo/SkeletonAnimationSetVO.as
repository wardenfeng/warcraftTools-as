package me.feng3d.vo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SkeletonAnimationSetVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const JOINTSPERVERTEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("me.feng3d.vo.SkeletonAnimationSetVO.jointsPerVertex", "jointsPerVertex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var jointsPerVertex:uint;

		/**
		 *  @private
		 */
		public static const NUMJOINTS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("me.feng3d.vo.SkeletonAnimationSetVO.numJoints", "numJoints", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var numJoints:uint;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.jointsPerVertex);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, this.numJoints);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var jointsPerVertex$count:uint = 0;
			var numJoints$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (jointsPerVertex$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkeletonAnimationSetVO.jointsPerVertex cannot be set twice.');
					}
					++jointsPerVertex$count;
					this.jointsPerVertex = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 2:
					if (numJoints$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkeletonAnimationSetVO.numJoints cannot be set twice.');
					}
					++numJoints$count;
					this.numJoints = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
