// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaunchAdapter extends TypeAdapter<Launch> {
  @override
  final int typeId = 0;

  @override
  Launch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Launch(
      id: fields[0] as String,
      details: fields[1] as String,
      launchDateUtc: fields[2] as DateTime,
      launchSite: fields[3] as LaunchSite,
      launchYear: fields[4] as String,
      missionName: fields[5] as String,
      links: fields[6] as Links,
    );
  }

  @override
  void write(BinaryWriter writer, Launch obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.launchDateUtc)
      ..writeByte(3)
      ..write(obj.launchSite)
      ..writeByte(4)
      ..write(obj.launchYear)
      ..writeByte(5)
      ..write(obj.missionName)
      ..writeByte(6)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
