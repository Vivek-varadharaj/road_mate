// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailHiveAdapter extends TypeAdapter<ProductDetailHive> {
  @override
  final int typeId = 1;

  @override
  ProductDetailHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailHive(
      id: fields[0] as int,
      brandId: fields[1] as int,
      productName: fields[2] as String,
      offerPrice: fields[3] as int,
      price: fields[4] as int,
      description: fields[5] as String,
      status: fields[6] as int,
      createdAt: fields[7] as String,
      updatedAt: fields[8] as String,
      catId: fields[9] as int,
      images: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailHive obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brandId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.offerPrice)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.catId)
      ..writeByte(10)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
