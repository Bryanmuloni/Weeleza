// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemCategoryAdapter extends TypeAdapter<ItemCategory> {
  @override
  final int typeId = 2;

  @override
  ItemCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemCategory.Documents;
      case 1:
        return ItemCategory.Parcels;
      case 2:
        return ItemCategory.Produce;
      case 3:
        return ItemCategory.Cargo;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ItemCategory obj) {
    switch (obj) {
      case ItemCategory.Documents:
        writer.writeByte(0);
        break;
      case ItemCategory.Parcels:
        writer.writeByte(1);
        break;
      case ItemCategory.Produce:
        writer.writeByte(2);
        break;
      case ItemCategory.Cargo:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
