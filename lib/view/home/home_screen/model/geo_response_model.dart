import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_demo/core/base/model/base_model.dart';
import 'package:weather_app_demo/core/constants/hive/hive_constants.dart';

part 'geo_response_model.g.dart';

@HiveType(typeId: HiveConstants.geoModelId)
@JsonSerializable()
class GeoResponseModel extends BaseModel<GeoResponseModel>{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String? LocalizedName;
  @HiveField(2)
  final String? Key;
  GeoResponseModel({this.LocalizedName,this.Key});

  @override
  GeoResponseModel fromJson(Map<String, dynamic> json) {
    return _$GeoResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

}