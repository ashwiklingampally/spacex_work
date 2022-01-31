// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchsite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaunchSiteAdapter extends TypeAdapter<LaunchSite> {
  @override
  final int typeId = 1;

  @override
  LaunchSite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LaunchSite(
      siteId: fields[0] as String,
      siteName: fields[1] as String,
      siteNameLong: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LaunchSite obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.siteId)
      ..writeByte(1)
      ..write(obj.siteName)
      ..writeByte(2)
      ..write(obj.siteNameLong);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchSiteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
