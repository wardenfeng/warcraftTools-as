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
	public dynamic final class SubGeometryVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INDICES:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("me.feng3d.vo.SubGeometryVO.indices", "indices", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var indices:Array = [];

		/**
		 *  @private
		 */
		public static const POSITIONS:RepeatedFieldDescriptor$TYPE_FLOAT = new RepeatedFieldDescriptor$TYPE_FLOAT("me.feng3d.vo.SubGeometryVO.positions", "positions", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		[ArrayElementType("Number")]
		public var positions:Array = [];

		/**
		 *  @private
		 */
		public static const UVS:RepeatedFieldDescriptor$TYPE_FLOAT = new RepeatedFieldDescriptor$TYPE_FLOAT("me.feng3d.vo.SubGeometryVO.uvs", "uvs", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		[ArrayElementType("Number")]
		public var uvs:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var indices$index:uint = 0; indices$index < this.indices.length; ++indices$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.indices[indices$index]);
			}
			for (var positions$index:uint = 0; positions$index < this.positions.length; ++positions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.positions[positions$index]);
			}
			for (var uvs$index:uint = 0; uvs$index < this.uvs.length; ++uvs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.uvs[uvs$index]);
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
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.indices);
						break;
					}
					this.indices.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_FLOAT, this.positions);
						break;
					}
					this.positions.push(com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_FLOAT, this.uvs);
						break;
					}
					this.uvs.push(com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
