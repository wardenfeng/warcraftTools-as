package me.feng3d.vo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import me.feng3d.vo.SkeletonVO;
	import me.feng3d.vo.SkeletonAnimationSetVO;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SkeletonAnimatorVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SKELETON:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.SkeletonAnimatorVO.skeleton", "skeleton", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.SkeletonVO; });

		public var skeleton:me.feng3d.vo.SkeletonVO;

		/**
		 *  @private
		 */
		public static const SKELETONANIMATIONSET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.SkeletonAnimatorVO.skeletonAnimationSet", "skeletonAnimationSet", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.SkeletonAnimationSetVO; });

		public var skeletonAnimationSet:me.feng3d.vo.SkeletonAnimationSetVO;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.skeleton);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.skeletonAnimationSet);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var skeleton$count:uint = 0;
			var skeletonAnimationSet$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (skeleton$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkeletonAnimatorVO.skeleton cannot be set twice.');
					}
					++skeleton$count;
					this.skeleton = new me.feng3d.vo.SkeletonVO();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skeleton);
					break;
				case 2:
					if (skeletonAnimationSet$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkeletonAnimatorVO.skeletonAnimationSet cannot be set twice.');
					}
					++skeletonAnimationSet$count;
					this.skeletonAnimationSet = new me.feng3d.vo.SkeletonAnimationSetVO();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skeletonAnimationSet);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
