import 'package:dio/dio.dart';
import 'package:knowplesy/app/storage/secure_storage.dart';

import '../../data/networking/api/log_out_api.dart';

class AccountInfoStorage {
  static const _keyEmail = 'email';
  static const _keyToken = 'token';
  static const _keyUserId = 'user_id';
  static const _keyLastName = 'lastName';
  static const _keyFirstName = 'firstName';
  static const _keyPhoneNumber = 'phone_number';
  static const _keyImageUrl = 'image_url';
  static const _keyNbrUndetectedAlert = 'nbr_undetectedAlert';
  static const _keyTrueAlert = 'trueAlert';
  static const _keyFalseAlert = 'falseAlert';

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: _keyEmail, value: email);
  }

  static saveImageUrl(String imageUrl) {
    SecureStorage.writeSecureData(key: _keyImageUrl, value: imageUrl);
  }

  static saveToken(String token) async {
    SecureStorage.writeSecureData(key: _keyToken, value: token);
  }

  static saveTrueAlert(String trueAlert) async {
    SecureStorage.writeSecureData(key: _keyToken, value: trueAlert);
  }

  static saveFalseAlert(String falseAlert) async {
    SecureStorage.writeSecureData(key: _keyToken, value: falseAlert);
  }

  static saveUserId(String userId) {
    SecureStorage.writeSecureData(key: _keyUserId, value: userId);
  }

  static saveFirstName(String firstName) {
    SecureStorage.writeSecureData(key: _keyFirstName, value: firstName);
  }

  static saveLastName(String lastName) {
    SecureStorage.writeSecureData(key: _keyLastName, value: lastName);
  }

  static saveNbrUndetectedAlert(String nbrUndetectedAlert) {
    SecureStorage.writeSecureData(
        key: _keyNbrUndetectedAlert, value: nbrUndetectedAlert);
  }

  static savePhone(String phoneNumber) {
    SecureStorage.writeSecureData(key: _keyPhoneNumber, value: phoneNumber);
  }

  static String? readFirstName() {
    return SecureStorage.readSecureData(_keyFirstName);
  }

  static String? readLastName() {
    return SecureStorage.readSecureData(_keyLastName);
  }

  static String? readTrueAlert() {
    return SecureStorage.readSecureData(_keyTrueAlert);
  }

  static String? readFalseAlert() {
    return SecureStorage.readSecureData(_keyFalseAlert);
  }

  static String? readImageUrl() {
    return SecureStorage.readSecureData(_keyImageUrl);
  }

  static String? readEmail() {
    String? email = SecureStorage.readSecureData(_keyEmail);

    return email;
  }

  static String? readToken() {
    return SecureStorage.readSecureData((_keyToken));
  }

  static String? readPhone() {
    return SecureStorage.readSecureData(_keyPhoneNumber);
  }

  static String? readUserId() {
    return SecureStorage.readSecureData(_keyUserId);
  }

  static String? readNbrUndetectedAlert() {
    return SecureStorage.readSecureData(_keyNbrUndetectedAlert);
  }

  /// Removes the token  from the secure storage, so user is no longer loggen in.
  static removeToken() {
    return SecureStorage.deleteSecureData(_keyToken);
  }

  logout(context) {
    LogoutApi logoutApi = LogoutApi();

    logoutApi.secureGetData().then((value) {});
    removeUserData();
  }

  removeUserData() {
    //Now remove everything in the local storage
    SecureStorage.deleteSecureData(_keyToken);
  }
}

class DioInterceptors extends Interceptors {
  void onRequest(RequestOptions requestOptions,
      RequestInterceptorHandler requestInterceptorHandler) {
    requestOptions.headers["token"] = SecureStorage.readSecureData('token');
  }
}
