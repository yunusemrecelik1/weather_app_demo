// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyResponseModel _$DailyResponseModelFromJson(Map<String, dynamic> json) =>
    DailyResponseModel(
      DailyForecasts: (json['DailyForecasts'] as List<dynamic>?)
          ?.map((e) =>
              DailyForecastsModel.fromJson((e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, e as Object),
              )))
          .toList(),
    );

Map<String, dynamic> _$DailyResponseModelToJson(DailyResponseModel instance) =>
    <String, dynamic>{
      'DailyForecasts': instance.DailyForecasts,
    };

DailyForecastsModel _$DailyForecastsModelFromJson(Map<String, dynamic> json) =>
    DailyForecastsModel(
      Date: json['Date'] as String?,
      EpochDate: json['EpochDate'] as int?,
      MobileLink: json['MobileLink'] as String?,
      Sources:
          (json['Sources'] as List<dynamic>?)?.map((e) => e as String).toList(),
      Temperature: json['Temperature'] == null
          ? null
          : TemperatureModel.fromJson(
              (json['Temperature'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
    );

Map<String, dynamic> _$DailyForecastsModelToJson(
        DailyForecastsModel instance) =>
    <String, dynamic>{
      'Date': instance.Date,
      'EpochDate': instance.EpochDate,
      'Sources': instance.Sources,
      'MobileLink': instance.MobileLink,
      'Temperature': instance.Temperature,
    };

TemperatureModel _$TemperatureModelFromJson(Map<String, dynamic> json) =>
    TemperatureModel(
      Minimum: json['Minimum'] == null
          ? null
          : MinimumModel.fromJson((json['Minimum'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
      Maximum: json['Maximum'] == null
          ? null
          : MinimumModel.fromJson((json['Maximum'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
    );

Map<String, dynamic> _$TemperatureModelToJson(TemperatureModel instance) =>
    <String, dynamic>{
      'Minimum': instance.Minimum,
      'Maximum': instance.Maximum,
    };

MinimumModel _$MinimumModelFromJson(Map<String, dynamic> json) => MinimumModel(
      Value: (json['Value'] as num?)?.toDouble(),
      Unit: json['Unit'] as String?,
      UnitType: json['UnitType'] as int?,
    );

Map<String, dynamic> _$MinimumModelToJson(MinimumModel instance) =>
    <String, dynamic>{
      'Value': instance.Value,
      'Unit': instance.Unit,
      'UnitType': instance.UnitType,
    };
