import 'dart:io';

import 'package:dio/dio.dart';

import 'ICoreDio.dart';
import 'core_dio.dart';


class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions =
    BaseOptions(baseUrl: 'https://dataservice.accuweather.com/',headers: {
      //HttpHeaders.authorizationHeader: 'YOUR KEY HERE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    coreDio = CoreDio(baseOptions);
  }
}
