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
      id: fields[0] as dynamic,
      name: fields[2] as String,
      updated: fields[1] as int,
      flagURL: fields[9] as String?,
      active: fields[10] as int,
      cases: fields[3] as int,
      deaths: fields[5] as int,
      recovered: fields[7] as int,
      todayCases: fields[4] as int,
      todayDeaths: fields[6] as int,
      todayRecovered: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.updated)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.cases)
      ..writeByte(4)
      ..write(obj.todayCases)
      ..writeByte(5)
      ..write(obj.deaths)
      ..writeByte(6)
      ..write(obj.todayDeaths)
      ..writeByte(7)
      ..write(obj.recovered)
      ..writeByte(8)
      ..write(obj.todayRecovered)
      ..writeByte(9)
      ..write(obj.flagURL)
      ..writeByte(10)
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
