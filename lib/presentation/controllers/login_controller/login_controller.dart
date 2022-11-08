 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
//
 class LoginController extends GetxController  {
   TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
// //  final UserApi _userApi = UserApi();
   bool isVisiblePassword = true;
//   //GlobalKey<FormState> signInFormKey;
   RxBool isLoading = false.obs;
// //  ValidatorSignIn validator = ValidatorSignIn();
//
//   RxString error = ''.obs;
//
//   void showHidePassword() {
//     isVisiblePassword = !isVisiblePassword;
//     update();
//   }
//
//   login() async {
//     error.value = '';
//     isLoading.value = true;
//     try {
//      // SimpleJsonResource jsonResource =
//       await _userApi.login(emailController.text, passwordController.text);
//       isLoading.value = false;
//       if (jsonResource != null) {
//         if (jsonResource.code == 200) {
//           Get.toNamed(AppRouting.loginSuccess);
//         } else {
//           error.value = jsonResource.message;
//         }
//       }
//     } catch (e) {
//       isLoading.value = false;
//       throw e;
//     }
//   }
}
