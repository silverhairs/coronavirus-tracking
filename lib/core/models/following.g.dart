// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FollowingAdapter extends TypeAdapter<Following> {
  @override
  final int typeId = 0;

  @override
  Following read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Following(
      flagURL: fields[7] as String,
      cases: fields[1] as int,
      country: fields[0] as String,
      critical: fields[6] as int,
      deaths: fields[3] as int,
      recovered: fields[5] as int,
      todayCases: fields[2] as int,
      todayDeaths: fields[4] as int,
      isFollowed: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Following obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.cases)
      ..writeByte(2)
      ..write(obj.todayCases)
      ..writeByte(3)
      ..write(obj.deaths)
      ..writeByte(4)
      ..write(obj.todayDeaths)
      ..writeByte(5)
      ..write(obj.recovered)
      ..writeByte(6)
      ..write(obj.critical)
      ..writeByte(7)
      ..write(obj.flagURL)
      ..writeByte(8)
      ..write(obj.isFollowed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
