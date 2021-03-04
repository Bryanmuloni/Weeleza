// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeliveryAdapter extends TypeAdapter<Delivery> {
  @override
  final int typeId = 0;

  @override
  Delivery read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Delivery(
      itemName: fields[0] as String,
      itemDescription: fields[1] as String,
      itemCategory: fields[2] as ItemCategory,
      itemSize: fields[3] as String,
      departureTime: fields[4] as String,
      arrivalTime: fields[5] as String,
      destination: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Delivery obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.itemDescription)
      ..writeByte(2)
      ..write(obj.itemCategory)
      ..writeByte(3)
      ..write(obj.itemSize)
      ..writeByte(4)
      ..write(obj.departureTime)
      ..writeByte(5)
      ..write(obj.arrivalTime)
      ..writeByte(6)
      ..write(obj.destination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeliveryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
