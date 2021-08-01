// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_overview.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CovidOverviewAdapter extends TypeAdapter<CovidOverview> {
  @override
  final int typeId = 3;

  @override
  CovidOverview read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CovidOverview(
      updated: fields[0] as int,
      cases: fields[1] as int?,
      active: fields[7] as int?,
      activePerOneMillion: fields[17] as double?,
      affectedCountries: fields[20] as int?,
      casesPerOneMillion: fields[9] as double?,
      critical: fields[8] as int?,
      criticalPerOneMillion: fields[19] as double?,
      deaths: fields[3] as int?,
      deathsPerOneMillion: fields[10] as double?,
      oneCasePerPeople: fields[14] as double?,
      oneDeathPerPeople: fields[15] as double?,
      oneTestPerPeople: fields[16] as double?,
      population: fields[13] as int?,
      recovered: fields[5] as int?,
      recoveredPerOneMillion: fields[18] as double?,
      tests: fields[11] as int?,
      testsPerOneMillion: fields[12] as double?,
      todayCases: fields[2] as int?,
      todayDeaths: fields[4] as int?,
      todayRecovered: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CovidOverview obj) {
    writer
      ..writeByte(21)
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
      ..write(obj.casesPerOneMillion)
      ..writeByte(10)
      ..write(obj.deathsPerOneMillion)
      ..writeByte(11)
      ..write(obj.tests)
      ..writeByte(12)
      ..write(obj.testsPerOneMillion)
      ..writeByte(13)
      ..write(obj.population)
      ..writeByte(14)
      ..write(obj.oneCasePerPeople)
      ..writeByte(15)
      ..write(obj.oneDeathPerPeople)
      ..writeByte(16)
      ..write(obj.oneTestPerPeople)
      ..writeByte(17)
      ..write(obj.activePerOneMillion)
      ..writeByte(18)
      ..write(obj.recoveredPerOneMillion)
      ..writeByte(19)
      ..write(obj.criticalPerOneMillion)
      ..writeByte(20)
      ..write(obj.affectedCountries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CovidOverviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
