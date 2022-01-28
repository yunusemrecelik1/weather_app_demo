import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_demo/core/base/model/base_model.dart';

part 'daily_response_model.g.dart';
@JsonSerializable()
class DailyResponseModel extends BaseModel<DailyResponseModel> {
  List<DailyForecastsModel>? DailyForecasts;
  DailyResponseModel({this.DailyForecasts});

  @override
  DailyResponseModel fromJson(Map<String, dynamic> json) {
    return _$DailyResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DailyResponseModelToJson(this);
  }
}

@JsonSerializable()
class DailyForecastsModel extends BaseModel<DailyForecastsModel>{
  String? Date;
  int? EpochDate;
  List<String>? Sources;
  String? MobileLink;
  TemperatureModel? Temperature;
  DailyForecastsModel({
    this.Date,
    this.EpochDate,
    this.MobileLink,
    this.Sources,
    this.Temperature,
  });

  @override
  DailyForecastsModel fromJson(Map<String, dynamic> json) {
    return _$DailyForecastsModelFromJson(json);
  }
  factory DailyForecastsModel.fromJson(Map<String, Object> json) {
    return _$DailyForecastsModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DailyForecastsModelToJson(this);
  }
}
@JsonSerializable()
class TemperatureModel extends BaseModel<TemperatureModel>{
  MinimumModel? Minimum;
  MinimumModel? Maximum;

  TemperatureModel({this.Minimum, this.Maximum});

  @override
  TemperatureModel fromJson(Map<String, dynamic> json) {
    return _$TemperatureModelFromJson(json);
  }
  factory TemperatureModel.fromJson(Map<String, Object> json) {
    return _$TemperatureModelFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
@JsonSerializable()
class MinimumModel extends BaseModel<MinimumModel>{
  double? Value;
  String? Unit;
  int? UnitType;

  MinimumModel({this.Value, this.Unit, this.UnitType});

  @override
  MinimumModel fromJson(Map<String, dynamic> json) {
    return _$MinimumModelFromJson(json);
  }
  factory MinimumModel.fromJson(Map<String, Object> json) {
    return _$MinimumModelFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
