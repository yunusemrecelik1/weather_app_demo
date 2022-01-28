import 'package:weather_app_demo/core/init/network/dio_network/ICoreDio.dart';
import 'package:weather_app_demo/core/init/network/dio_network/network_manager.dart';
import 'package:weather_app_demo/view/home/home_screen/model/daily_response_model.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_model.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_response_model.dart';

abstract class IHomeService {
  final NetworkManager manager;
  IHomeService(this.manager);

  Future<GeoResponseModel?> fetchGeo(GeoModel model);
  Future<DailyResponseModel?> fetchDaily(String key);
}
