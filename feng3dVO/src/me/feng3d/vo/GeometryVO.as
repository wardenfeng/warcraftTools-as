package me.feng3d.vo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import me.feng3d.vo.SubGeometryVO;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GeometryVO extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SUBGEOMETRIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("me.feng3d.vo.GeometryVO.subGeometries", "subGeometries", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return me.feng3d.vo.SubGeometryVO; });

		[ArrayElementType("me.feng3d.vo.SubGeometryVO")]
		public var subGeometries:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var subGeometries$index:uint = 0; subGeometries$index < this.subGeometries.length; ++subGeometries$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.subGeometries[subGeometries$index]);
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
					this.subGeometries.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new me.feng3d.vo.SubGeometryVO()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
