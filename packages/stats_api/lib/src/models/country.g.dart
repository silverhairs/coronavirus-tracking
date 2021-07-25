// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContinentAdapter extends TypeAdapter<Continent> {
  @override
  final int typeId = 0;

  @override
  Continent read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Continent.asia;
      case 1:
        return Continent.europe;
      case 2:
        return Continent.africa;
      case 3:
        return Continent.northAmerica;
      case 4:
        return Continent.southAmerica;
      case 5:
        return Continent.australiaOceania;
      case 6:
        return Continent.unknown;
      default:
        return Continent.asia;
    }
  }

  @override
  void write(BinaryWriter writer, Continent obj) {
    switch (obj) {
      case Continent.asia:
        writer.writeByte(0);
        break;
      case Continent.europe:
        writer.writeByte(1);
        break;
      case Continent.africa:
        writer.writeByte(2);
        break;
      case Continent.northAmerica:
        writer.writeByte(3);
        break;
      case Continent.southAmerica:
        writer.writeByte(4);
        break;
      case Continent.australiaOceania:
        writer.writeByte(5);
        break;
      case Continent.unknown:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContinentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final int typeId = 2;

  @override
  Country read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Country(
      updated: fields[0] as int?,
      name: fields[1] as String,
      info: fields[2] as CountryInfo,
      active: fields[9] as int?,
      activePerOneMillion: fields[20] as double?,
      cases: fields[3] as int?,
      casesPerOneMillion: fields[11] as double?,
      continent: fields[16] as Continent,
      critical: fields[10] as int?,
      criticalPerOneMillion: fields[22] as double?,
      deaths: fields[5] as int?,
      deathsPerOneMillion: fields[12] as double?,
      oneCasePerPeople: fields[17] as double?,
      oneDeathPerPeople: fields[18] as double?,
      oneTestPerPeople: fields[19] as double?,
      population: fields[15] as int?,
      recovered: fields[7] as int?,
      recoveredPerOneMillion: fields[21] as double?,
      tests: fields[13] as int?,
      testsPerOneMillion: fields[14] as double?,
      todayCases: fields[4] as int?,
      todayDeaths: fields[6] as int?,
      todayRecovered: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.updated)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.info)
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
      ..write(obj.active)
      ..writeByte(10)
      ..write(obj.critical)
      ..writeByte(11)
      ..write(obj.casesPerOneMillion)
      ..writeByte(12)
      ..write(obj.deathsPerOneMillion)
      ..writeByte(13)
      ..write(obj.tests)
      ..writeByte(14)
      ..write(obj.testsPerOneMillion)
      ..writeByte(15)
      ..write(obj.population)
      ..writeByte(16)
      ..write(obj.continent)
      ..writeByte(17)
      ..write(obj.oneCasePerPeople)
      ..writeByte(18)
      ..write(obj.oneDeathPerPeople)
      ..writeByte(19)
      ..write(obj.oneTestPerPeople)
      ..writeByte(20)
      ..write(obj.activePerOneMillion)
      ..writeByte(21)
      ..write(obj.recoveredPerOneMillion)
      ..writeByte(22)
      ..write(obj.criticalPerOneMillion);
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

class CountryInfoAdapter extends TypeAdapter<CountryInfo> {
  @override
  final int typeId = 1;

  @override
  CountryInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryInfo(
      id: fields[0] as int,
      iso2: fields[1] as String?,
      iso3: fields[2] as String?,
      latitute: fields[3] as double?,
      longitude: fields[4] as double?,
      flagURL: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.iso2)
      ..writeByte(2)
      ..write(obj.iso3)
      ..writeByte(3)
      ..write(obj.latitute)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.flagURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
