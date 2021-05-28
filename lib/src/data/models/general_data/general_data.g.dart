// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeneralDataAdapter extends TypeAdapter<GeneralData> {
  @override
  final int typeId = 1;

  @override
  GeneralData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeneralData(
      updated: fields[0] as int,
      affectedCountries: fields[17] as int,
      cases: fields[1] as int,
      tests: fields[11] as int,
      active: fields[7] as int,
      recovered: fields[5] as int,
      critical: fields[8] as int,
      deaths: fields[3] as int,
      todayCases: fields[2] as int,
      todayRecovered: fields[6] as int,
      todayDeaths: fields[4] as int,
      casesPerMillion: fields[9] as double,
      activePerMillion: fields[14] as double,
      criticalPerMillion: fields[16] as double,
      deathsPerMillion: fields[10] as double,
      population: fields[13] as int,
      recoveredPerMillion: fields[15] as double,
      testsPerMilllion: fields[12] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GeneralData obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.updated)
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
      ..write(obj.todayRecovered)
      ..writeByte(7)
      ..write(obj.active)
      ..writeByte(8)
      ..write(obj.critical)
      ..writeByte(9)
      ..write(obj.casesPerMillion)
      ..writeByte(10)
      ..write(obj.deathsPerMillion)
      ..writeByte(11)
      ..write(obj.tests)
      ..writeByte(12)
      ..write(obj.testsPerMilllion)
      ..writeByte(13)
      ..write(obj.population)
      ..writeByte(14)
      ..write(obj.activePerMillion)
      ..writeByte(15)
      ..write(obj.recoveredPerMillion)
      ..writeByte(16)
      ..write(obj.criticalPerMillion)
      ..writeByte(17)
      ..write(obj.affectedCountries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
