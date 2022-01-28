import 'package:weather_app_demo/core/base/model/base_model.dart';
import 'package:weather_app_demo/core/constants/enums/http_request_enum.dart';
import '../IResponseModel.dart';

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

