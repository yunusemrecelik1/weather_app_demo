import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app_demo/core/constants/hive/hive_constants.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_response_model.dart';

import 'ICacheManager.dart';

class GeoCacheManager extends ICacheManager<GeoResponseModel> {
  GeoCacheManager(String key) : super(key);
  Box<GeoResponseModel>? _box;
  @override
  Future<void> addItems(List<GeoResponseModel> items) async {
    await _box?.addAll(items);
  }

  @override
  Future<void> putItems(List<GeoResponseModel> items) async {
    await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  GeoResponseModel? getItem(String key) {
    return _box?.get(key);
  }

  @override
  Future<void> putItem(String key, GeoResponseModel item) async {
    await _box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }

  @override
  List<GeoResponseModel>? getValues() {
    return _box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.geoModelId)) {
      Hive.registerAdapter(GeoResponseModelAdapter());
    }
  }

  @override
  Future<void> addItem(GeoResponseModel item) async {
   await _box?.add(item);
  }
}