
import 'package:dio/dio.dart';
import 'package:knowplesy/app/config/interceptor.dart';

import '../../../app/config/dio_singleton.dart';
import '../../../app/storage/secure_storage.dart';
import '../json/abstract__json_resource.dart';

abstract class ApiManager {
  final DioSingleton dioSingleton = DioSingleton();
  Map<String, dynamic> defaultHeaders = {
    // 'accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
    "authorization": "Bearer ${SecureStorage.readSecureData('token')}"
  };

  String apiUrl();

  AbstractJsonResource fromJson(data);

  ///Post Data withOut Token
  Future<AbstractJsonResource?> postData(dataToPost) async {
    dioSingleton.dio.interceptors.add(AppInterceptor());
    AbstractJsonResource? json;
    var data;
    return dioSingleton.dio
        .post(
      apiUrl(),
      data: dataToPost,
    )
        .then((value) {
      data = value.data;
      json = fromJson(data);
      return json;
    });
  }

  ///Get Data from Server with token
  Future secureGetData({data}) async {
    AbstractJsonResource? json;
    dioSingleton.dio.interceptors.add(AppInterceptor());

    var data;
    return dioSingleton.dio
        .get(
      apiUrl(),
      queryParameters: data,
    )
        .then((value) {
      data = value.data;
      json = fromJson(data);
      return json;
    }).catchError((error, stackTrace) {});
  }

  ///Post Data to Server with token

  Future securePost({dataToPost}) async {

    AbstractJsonResource? json;
    dioSingleton.dio.interceptors.add(AppInterceptor());

    var data;
    return dioSingleton.dio
        .post(
      apiUrl(),
      data: dataToPost,
    )
        .then((value) {
      data = value.data;
      json = fromJson(data);
      return json;
    }).catchError((error, stackTrace) {});
  }

  ///Delete Data  from Server with token
  Future secureDelete({data}) async {
    Map<String, dynamic> defaultHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      "authorization": "Bearer ${SecureStorage.readSecureData('token')}"
    };
    return dioSingleton.dio
        .delete(
      apiUrl(),
      queryParameters: data,
      options: Options(
          headers: {
            ...defaultHeaders,
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 405;
          }),
    )
        .then((value) {
      return value;
    }).catchError((error, stackTrace) {});
  }
}
