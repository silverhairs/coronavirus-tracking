// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final int typeId = 0;

  @override
  Country read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Country(
      flagURL: fields[7] as String,
      totalCases: fields[1] as int,
      name: fields[0] as String,
      critical: fields[6] as int,
      totalDeaths: fields[3] as int,
      recoveries: fields[5] as int,
      todayCases: fields[2] as int,
      todayDeaths: fields[4] as int,
      isFollowed: fields[8] as bool,
      activeCases: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.totalCases)
      ..writeByte(2)
      ..write(obj.todayCases)
      ..writeByte(3)
      ..write(obj.totalDeaths)
      ..writeByte(4)
      ..write(obj.todayDeaths)
      ..writeByte(5)
      ..write(obj.recoveries)
      ..writeByte(6)
      ..write(obj.critical)
      ..writeByte(7)
      ..write(obj.flagURL)
      ..writeByte(8)
      ..write(obj.isFollowed)
      ..writeByte(9)
      ..write(obj.activeCases);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
