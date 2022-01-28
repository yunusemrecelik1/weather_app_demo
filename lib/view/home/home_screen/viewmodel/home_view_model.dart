import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_demo/core/base/model/base_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_demo/core/init/locale_db/ICacheManager.dart';
import 'package:weather_app_demo/core/init/locale_db/geo_cache_manager.dart';
import 'package:weather_app_demo/core/init/network/dio_network/network_manager.dart';
import 'package:weather_app_demo/view/home/home_screen/model/daily_response_model.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_model.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_response_model.dart';
import 'package:weather_app_demo/view/home/home_screen/service/IHomeService.dart';
import 'package:weather_app_demo/view/home/home_screen/service/home_service.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
  late IHomeService homeService;
  DailyResponseModel? model;
  GeoResponseModel? geoResponseModel;
  bool isLoading = true;
  late Position position;
  late final ICacheManager<GeoResponseModel> cacheManager;
  String key = 'cache';
  @override
  void init() {
    homeService = HomeService(NetworkManager.instance!);
    cacheManager = GeoCacheManager(key);
    determinePosition();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  void changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> determinePosition() async {
    await cacheManager.init();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Servis Dışı');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('İzin Verilmedi');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('İzin Verilmedi');
    }
    position = await Geolocator.getCurrentPosition();
    bool isConnect = await _checkConnectivityState();
    if(isConnect){
      getData();
    }
    else {
      getLocaleData();
    }
  }

  Future<bool> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.wifi && result != ConnectivityResult.mobile) {
      return false;
    }
    else {
      return true;
    }
  }

  Future<void> getData() async{
      final geoResponse = await homeService.fetchGeo(
          GeoModel(longitude:position.longitude.toString(), latitude:position.latitude.toString()));
      if(geoResponse != null){
        geoResponseModel = geoResponse;
        cacheManager.putItem(key,geoResponseModel!);
    }
    final locationResponse = await homeService.fetchDaily(geoResponseModel?.Key ?? "");
    if(locationResponse != null){
      model = locationResponse;
      if(model!.DailyForecasts != null){
        for(int i = 0; i<model!.DailyForecasts!.length; i++){
          model!.DailyForecasts![i].Date = model!.DailyForecasts![i].Date!.substring(0,model!.DailyForecasts![i].Date!.indexOf('T'));
        }
      }
    }
    changeLoading();
  }
  Future<void> getLocaleData() async{
    geoResponseModel = cacheManager.getItem(key);
    final locationResponse = await homeService.fetchDaily(geoResponseModel?.Key ?? "");
    if(locationResponse != null){
      model = locationResponse;
      if(model!.DailyForecasts != null){
        for(int i = 0; i<model!.DailyForecasts!.length; i++){
          model!.DailyForecasts![i].Date = model!.DailyForecasts![i].Date!.substring(0,model!.DailyForecasts![i].Date!.indexOf('T'));
        }
      }
    }
    changeLoading();
  }
}

