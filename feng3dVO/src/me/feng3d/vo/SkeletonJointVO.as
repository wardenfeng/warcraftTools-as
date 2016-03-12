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
	public dynamic final class SkeletonJointVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PARENTINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("me.feng3d.vo.SkeletonJointVO.parentIndex", "parentIndex", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var parentIndex:int;

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("me.feng3d.vo.SkeletonJointVO.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var name:String;

		/**
		 *  @private
		 */
		public static const INVERSEBINDPOSE:RepeatedFieldDescriptor$TYPE_FLOAT = new RepeatedFieldDescriptor$TYPE_FLOAT("me.feng3d.vo.SkeletonJointVO.inverseBindPose", "inverseBindPose", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		[ArrayElementType("Number")]
		public var inverseBindPose:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.parentIndex);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.name);
			for (var inverseBindPose$index:uint = 0; inverseBindPose$index < this.inverseBindPose.length; ++inverseBindPose$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.inverseBindPose[inverseBindPose$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var parentIndex$count:uint = 0;
			var name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (parentIndex$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkeletonJointVO.parentIndex cannot be set twice.');
					}
					++parentIndex$count;
					this.parentIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkeletonJointVO.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_FLOAT, this.inverseBindPose);
						break;
					}
					this.inverseBindPose.push(com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
