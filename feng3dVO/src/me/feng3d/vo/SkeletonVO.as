package me.feng3d.vo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import me.feng3d.vo.SkeletonJointVO;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SkeletonVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const JOINTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.SkeletonVO.joints", "joints", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.SkeletonJointVO; });

		[ArrayElementType("me.feng3d.vo.SkeletonJointVO")]
		public var joints:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var joints$index:uint = 0; joints$index < this.joints.length; ++joints$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.joints[joints$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.joints.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new me.feng3d.vo.SkeletonJointVO()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
