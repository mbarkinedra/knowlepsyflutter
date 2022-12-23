import 'package:dio/dio.dart' as di;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';

import '../../presentation/controllers/register_controller/register_controller.dart';
import '../storage/secure_storage.dart';

class AppInterceptor extends di.Interceptor {
  @override
  void onRequest(
      di.RequestOptions options, di.RequestInterceptorHandler handler) {
    options.headers["authorization"] =
        "Bearer ${AccountInfoStorage.readToken()}";

// "api-key": "7Xnr!var&m65WmEQLam2JfBAcmKt1r",
//     "lang": "en",
//     "authorization":
//     "Bearer ${SecureStorage.readToken()}",
//     "device-key":"mobile",
//     "company":"maisarah-ibs"
    super.onRequest(options, handler);
  }

  @override
  void onError(di.DioError err, di.ErrorInterceptorHandler handler) {
    if (err.response!.statusCode == 422) {
      Get.snackbar("Oups", "Email alredy exist",
          backgroundColor: AppColors.secondryColor, colorText: Colors.white);
      Get.find<RegisterController>().desableIsLoading();
      // } else if (err.response!.statusCode == 404) {
      //   Get.snackbar("Oups!", "",
      //       backgroundColor: AppColors.secondryColor, colorText: Colors.white);
      //   Get.find<LoginController>().desableIsLoading();
      // }
    }
  }
  @override
  void onResponse(di.Response response, di.ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 || response.statusCode == 201) {
    } else {
      Get.snackbar("err", "message");
    }
    return super.onResponse(response, handler);
  }
}
