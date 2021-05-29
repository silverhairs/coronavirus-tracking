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
      id: fields[1] as dynamic,
      name: fields[3] as String,
      updated: fields[2] as int,
      isTracked: fields[0] as bool?,
      flagURL: fields[10] as String?,
      active: fields[11] as int,
      cases: fields[4] as int,
      deaths: fields[6] as int,
      recovered: fields[8] as int,
      todayCases: fields[5] as int,
      todayDeaths: fields[7] as int,
      todayRecovered: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.isTracked)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.updated)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.cases)
      ..writeByte(5)
      ..write(obj.todayCases)
      ..writeByte(6)
      ..write(obj.deaths)
      ..writeByte(7)
      ..write(obj.todayDeaths)
      ..writeByte(8)
      ..write(obj.recovered)
      ..writeByte(9)
      ..write(obj.todayRecovered)
      ..writeByte(10)
      ..write(obj.flagURL)
      ..writeByte(11)
      ..write(obj.active);
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
