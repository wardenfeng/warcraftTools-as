package me.feng3d.vo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import me.feng3d.vo.AnimatorVOType;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AnimatorVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("me.feng3d.vo.AnimatorVO.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, me.feng3d.vo.AnimatorVOType);

		public var type:int;

		/**
		 *  @private
		 */
		public static const ANIMATORDATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("me.feng3d.vo.AnimatorVO.animatorData", "animatorData", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var animatorData:flash.utils.ByteArray;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.type);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, this.animatorData);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var animatorData$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimatorVO.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (animatorData$count != 0) {
						throw new flash.errors.IOError('Bad data format: AnimatorVO.animatorData cannot be set twice.');
					}
					++animatorData$count;
					this.animatorData = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
