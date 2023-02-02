import 'package:dio/dio.dart';

class DioSingleton {
  Dio dio = Dio(BaseOptions(headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  }));

  static final DioSingleton _singleton = DioSingleton._internal();

  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal();
}
