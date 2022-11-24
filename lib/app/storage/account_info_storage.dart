import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/storage/secure_storage.dart';

import '../../data/networking/api/log_out_api.dart';
import '../../data/networking/json/user_json.dart';
import '../../persist.dart';
import '../../presentation/pages/login_page/login_page.dart';
import '../config/dio_singleton.dart';

class AccountInfoStorage extends GetxController {
  static const _keyEmail = 'email';
  static const _keyToken = 'token';
  static const _keyUserId = 'user_id';
  static const _key_lastName = 'LastName';
  static const _key_FirstName = 'LastNamefirstName';
  static const _key_phone_number = 'phone_number';



  saveEmail(String email) {
    SecureStorage.writeSecureData(key: _keyEmail, value: email);
  }

  saveToken(String token) async {
    SecureStorage.writeSecureData(key: _keyToken, value: token);
  }

  saveUserId(String userId) {
    SecureStorage.writeSecureData(key: _keyUserId, value: userId);
  }

  saveFirstName(String firstName) {
    SecureStorage.writeSecureData(key: _key_FirstName, value: firstName);
  }
  saveLastName(String lastName) {
    SecureStorage.writeSecureData(key: _key_lastName, value: lastName);
  }

  savePhone(String phoneNumber) {
    SecureStorage.writeSecureData(key: _key_phone_number, value: phoneNumber);
  }
  String? readFirstName() {
    return SecureStorage.readSecureData(_key_FirstName);
  }
  String? readLastName() {
    return SecureStorage.readSecureData(_key_lastName);
  }

  String? readEmail() {
    String? email = SecureStorage.readSecureData(_keyEmail);

    return email;
  }

  String? readToken() {
    return SecureStorage.readSecureData((_keyToken));
  }

  String? readPhone() {
    return SecureStorage.readSecureData(_key_phone_number);
  }

  String? readUserId() {
    return SecureStorage.readSecureData(_keyUserId);
  }

  /// Removes the token  from the secure storage, so user is no longer loggen in.
  removeToken() {
    return SecureStorage.deleteSecureData(_keyToken);
  }

  logout() {
    LogoutApi logoutApi = LogoutApi();

    logoutApi.secureGetData().then((value) {
      print("*" * 20);
      print(value);
      print("*" * 20);
      Get.offAll(LoginPage());
    });
    removeUserData();
  }

  removeUserData() {
    //Now remove everything in the local storage
    SecureStorage.deleteSecureData(_keyToken);
  }

  bool isLoggedIn() {
    var hashedPassword = SecureStorage.readSecureJsonData(_keyToken);
    print("hashedPassword    $hashedPassword");
    if ((hashedPassword ?? '') == '') {
      return false;
    }
    return true;
  }
}

class DioInterceptors extends Interceptors {
  @override
  void onRequest(RequestOptions requestOptions,
      RequestInterceptorHandler requestInterceptorHandler) {
    requestOptions.headers["token"] = SecureStorage.readSecureData('token');
  }
}
