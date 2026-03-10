// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReadBookEntityAdapter extends TypeAdapter<ReadBookEntity> {
  @override
  final int typeId = 1;

  @override
  ReadBookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReadBookEntity(
      id: fields[0] as int?,
      totalPages: fields[1] as int?,
      currentPage: fields[2] as int?,
      pdfPath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReadBookEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.totalPages)
      ..writeByte(2)
      ..write(obj.currentPage)
      ..writeByte(3)
      ..write(obj.pdfPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadBookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
