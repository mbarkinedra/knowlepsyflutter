import 'package:dio/dio.dart';

class DioSingleton {
  Dio dio = Dio(BaseOptions(
    //  receiveDataWhenStatusError: true,
     // connectTimeout: 60 * 1000, // 60 seconds
     // receiveTimeout: 60 * 1000 // 60 seconds
      headers: <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
  }
  ));

  static final DioSingleton _singleton = DioSingleton._internal();

  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal();
}
