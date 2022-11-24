import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/networking/api/sign_up_api.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final SignUpApi _userApi = SignUpApi();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController country = TextEditingController();

  bool isVisiblePassword = true;
  RxBool isLoading = false.obs;
  RxString globalErrors = ''.obs;

  void showHidePassword() {
    isVisiblePassword = !isVisiblePassword;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }

  postRegister(context) async {
    isLoading.value = true;
    globalErrors.value = '';
    Map<String, dynamic> data = {
      "email": email.text,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "password": password.text,
      "password_confirmation": password.text,
      "date_of_birth": dateOfBirth.text,
      "phone_number": phoneNumber.text,
      "country": country.text
    };
    _userApi.postData(data).then((value) {
      print("28888888888888888888888888888888");
      print(data);
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      update();
    });
  }
}
