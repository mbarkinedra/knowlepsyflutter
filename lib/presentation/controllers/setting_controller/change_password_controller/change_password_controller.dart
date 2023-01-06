import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/data/networking/json/user_json.dart';

import '../../../../app/util/app_colors.dart';
import '../../../../data/networking/api/auth_api.dart';
import '../../../../data/networking/api/change_password_api.dart';
import '../../../pages/home/setting_page/setting_page.dart';
import '../../../pages/login_page/login_page.dart';

class ChangePasswordViewController extends GetxController {
  final changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController oldPassword = TextEditingController();
  bool updatePassword = false;
  bool isVisiblePassword1 = true;
  bool isVisiblePassword2 = true;
  ChangePasswordApi changePasswordApi = ChangePasswordApi();
  late BuildContext context;

  RxBool isLoading = false.obs;

  AccountInfoStorage accountInfoStorage = AccountInfoStorage();

  void showHidePassword1() {
    isVisiblePassword1 = !isVisiblePassword1;

    update();
  }

  void showHidePassword2() {
    isVisiblePassword2 = !isVisiblePassword2;

    update();
  }

  clearAllData() {
    newPassword.text = "";
    oldPassword.text = "";
    confirmPassword.text = "";
    update();
  }

  changePassword(con) {
    Map<String, dynamic> data = {
      "oldPassword": oldPassword.text,
      "newPassword": newPassword.text,
    };

    changePasswordApi.securePost(dataToPost: data).then((value) async {
      print("*" * 20);
      print(value);
      print("*" * 20);
      Get.defaultDialog(
          title: "Confirmation",
          //  middleText: "Take a new phhoto or import one from your library",
          contentPadding: EdgeInsets.all(8),
          titlePadding: EdgeInsets.all(16),
          titleStyle: TextStyle(color: Colors.black),
          middleTextStyle: TextStyle(color: Colors.black),
          textConfirm: "Confirm",
          onConfirm: () {
            Navigator.pop(con);
            Get.back();
            clearAllData();
          },
          textCancel: "Cancel",
          cancelTextColor: AppColors.primaryColor,
          onCancel: () {
            Get.back();
          },
          buttonColor: Colors.white,
          confirmTextColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          radius: 10,
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Your password is changed"),
              )
            ],
          ));
    });
    update();
  }
}
