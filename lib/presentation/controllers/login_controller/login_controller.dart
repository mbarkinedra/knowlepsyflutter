import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';

import '../../../app/config/app_routing.dart';
import '../../../app/storage/secure_storage.dart';
import '../../../data/networking/api/auth_api.dart';
import '../../../data/networking/json/simple_json_resource.dart';
import '../../../data/networking/json/user_json.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserApi _userApi = UserApi();
  UserJson? userJson;
  bool isVisiblePassword = true;
  late GlobalKey<FormState> signInFormKey;
  RxBool isLoading = false.obs;

// ValidatorSignIn validator = ValidatorSignIn();

  RxString error = ''.obs;

  void showHidePassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  login(context) async {
    _userApi.postData({
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      userJson = value as UserJson;
      print("*" * 50);
      print(value);
      print(userJson?.token);
      print("*" * 50);
      SecureStorage.writeSecureData(key: 'token', value: userJson!.token!);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (
        context,
      ) =>
              ConnectBleutoothScreen()));
    });
  }
}
