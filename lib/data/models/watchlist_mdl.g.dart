// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_mdl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchlistMdlAdapter extends TypeAdapter<WatchlistMdl> {
  @override
  final int typeId = 0;

  @override
  WatchlistMdl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchlistMdl(
      id: fields[0] as String,
      title: fields[1] as String,
      posterPath: fields[2] as String?,
      addedTimeStamp: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, WatchlistMdl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.addedTimeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchlistMdlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
