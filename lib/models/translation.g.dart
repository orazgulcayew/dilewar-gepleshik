// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslatioinAdapter extends TypeAdapter<Translatioin> {
  @override
  final int typeId = 1;

  @override
  Translatioin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Translatioin(
      turkmen: fields[0] as String,
      english: fields[1] as String,
      italian: fields[2] as String,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Translatioin obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.turkmen)
      ..writeByte(1)
      ..write(obj.english)
      ..writeByte(2)
      ..write(obj.italian)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslatioinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
