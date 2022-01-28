// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoResponseModelAdapter extends TypeAdapter<GeoResponseModel> {
  @override
  final int typeId = 1;

  @override
  GeoResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoResponseModel(
      LocalizedName: fields[1] as String?,
      Key: fields[2] as String?,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, GeoResponseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.LocalizedName)
      ..writeByte(2)
      ..write(obj.Key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoResponseModel _$GeoResponseModelFromJson(Map<String, dynamic> json) =>
    GeoResponseModel(
      LocalizedName: json['LocalizedName'] as String?,
      Key: json['Key'] as String?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$GeoResponseModelToJson(GeoResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'LocalizedName': instance.LocalizedName,
      'Key': instance.Key,
    };
