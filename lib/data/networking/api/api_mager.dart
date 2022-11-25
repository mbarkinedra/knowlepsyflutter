import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../app/config/dio_singleton.dart';
import '../../../app/storage/secure_storage.dart';
import '../../security/network.dart';
import '../json/abstract__json_resource.dart';

abstract class ApiManager {
  final DioSingleton dioSingleton = DioSingleton();

  // Dio dio = Dio();

  Map<String, dynamic> defaultHeaders = {
   // 'accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
    "authorization": "Bearer ${SecureStorage.readSecureData('token')}"
  };

  String apiUrl();

  AbstractJsonResource fromJson(data);

  ///Post Data withOut Token
  Future<AbstractJsonResource?> postData(dataToPost) async {
    AbstractJsonResource? json;
    var data;
    return dioSingleton.dio
        .post(
      apiUrl(),
      data: dataToPost,
      options: Options(
          headers: defaultHeaders,
          //   followRedirects: false,
          validateStatus: (status) {
            return status! < 405;
          }),
    )
        .then((value) {
      // validateResponseStatusCode(value);
      data = value.data;
      json = fromJson(data);
      return json;
    });
  }

  ///Get Data from Server with token
  Future secureGetData() async {
    AbstractJsonResource? json;
    var data;
    return dioSingleton.dio
        .get(
      apiUrl(),
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
      print(value);
      data = value.data;
      json = fromJson(data);
      return json;
      //  validateResponseStatusCode(value);
    }).catchError((error, stackTrace) {
      //processServerError(error);
    });
  }

  ///Post Data to Server with token

  Future securePost({dataToPost}) async {
    print(jsonEncode(dataToPost));
    return dioSingleton.dio
        .post(
      apiUrl(),
      data: dataToPost,
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
      //  validateResponseStatusCode(value);
      return value;
    }).catchError((error, stackTrace) {
      //   processServerError(error);
    });
  }

  ///Delete Data  from Server with token

  Future secureDelete() async {
    return dioSingleton.dio
        .delete(
      apiUrl(),
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
      //  validateResponseStatusCode(value);
      return value;
    }).catchError((error, stackTrace) {
      //   processServerError(error);
    });
  }
}
