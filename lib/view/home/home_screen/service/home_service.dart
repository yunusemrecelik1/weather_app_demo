import 'package:weather_app_demo/core/constants/app/app_consts.dart';
import 'package:weather_app_demo/core/constants/enums/http_request_enum.dart';
import 'package:weather_app_demo/core/init/network/dio_network/network_manager.dart';
import 'package:weather_app_demo/view/home/home_screen/model/daily_response_model.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_model.dart';
import 'package:weather_app_demo/view/home/home_screen/model/geo_response_model.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  HomeService(NetworkManager manager) : super(manager);

  @override
  Future<GeoResponseModel?> fetchGeo(GeoModel model) async {
    final response = await manager.coreDio?.send<GeoResponseModel, GeoResponseModel>(
      "locations/v1/cities/geoposition/search?apikey=${AppConstants.apiKey}&q=${model.latitude},${model.longitude}",
      type: HttpTypes.GET,
      parseModel: GeoResponseModel(),
    );
    return response?.data;
  }

  @override
  Future<DailyResponseModel?> fetchDaily(String key) async {
    final response = await manager.coreDio?.send<DailyResponseModel, DailyResponseModel>(
      "forecasts/v1/daily/5day/$key?apikey=${AppConstants.apiKey}",
      type: HttpTypes.GET,
      parseModel: DailyResponseModel(),
    );
    return response?.data;
  }
}
