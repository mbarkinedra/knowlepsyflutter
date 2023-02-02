import 'package:dio/dio.dart' as di;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';

import '../../presentation/controllers/register_controller/register_controller.dart';

class AppInterceptor extends di.Interceptor {
  @override
  void onRequest(
      di.RequestOptions options, di.RequestInterceptorHandler handler) {
    options.headers["authorization"] =
        "Bearer ${AccountInfoStorage.readToken()}";

    super.onRequest(options, handler);
  }

  @override
  void onError(di.DioError err, di.ErrorInterceptorHandler handler) {
    if (err.response!.statusCode == 422) {
      Get.snackbar("Oups", "Email alredy exist",
          backgroundColor: AppColors.secondryColor, colorText: Colors.white);
      Get.find<RegisterController>().desableIsLoading();
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
