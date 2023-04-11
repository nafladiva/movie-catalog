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
      id: fields[0] as int,
      type: fields[1] as WatchlistType,
      title: fields[2] as String,
      posterPath: fields[3] as String?,
      addedTimeStamp: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, WatchlistMdl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
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
