import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';

import '../../../app/storage/secure_storage.dart';
import '../../../data/networking/api/auth_api.dart';
import '../../../data/networking/json/user_json.dart';
import '../../../domain/validator/validator_signIn.dart';
import '../../pages/login_page/BleutoothScreen/Braceletdisconnected.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserApi _userApi = UserApi();

  UserJson? userJson;
  bool isVisiblePassword = true;
  GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  ValidatorSignIn validator = ValidatorSignIn();
  RxString error = ''.obs;

  void showHidePassword() {
    isVisiblePassword = !isVisiblePassword;
    update();
  }

  desableIsLoading() {
    isLoading.value = false;
    update();
  }

  login(context) async {
    error.value = '';
    isLoading.value = true;
    _userApi.postData({
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      //  isLoading.value = false;
      userJson = value as UserJson;

      SecureStorage.writeSecureData(
          key: 'firstName', value: userJson!.user!.firstName!);

      SecureStorage.writeSecureData(key: 'token', value: userJson!.token!);
      SecureStorage.writeSecureData(
          key: 'user_id', value: userJson!.user!.id.toString());

      SecureStorage.writeSecureData(
          key: 'nbr_undetectedAlert',
          value: userJson!.user!.nbrUndetectedAlert!.toString());
      SecureStorage.writeSecureData(
          key: 'trueAlert', value: userJson!.user!.trueAlert!.toString());
      SecureStorage.writeSecureData(
          key: 'falseAlert', value: userJson!.user!.falseAlert!.toString());
      SecureStorage.writeSecureData(key: 'role', value: userJson!.user!.role!);
      SecureStorage.writeSecureData(
          key: 'imag', value: userJson!.user!.imageUrl!);
      SecureStorage.writeSecureData(
          key: 'firstName', value: userJson!.user!.firstName!);
      SecureStorage.writeSecureData(
          key: 'lastName', value: userJson!.user!.lastName!);
      SecureStorage.writeSecureData(
          key: 'email', value: userJson!.user!.email!);

      Get.offAll(Braceletdisconnected());
      isLoading.value = false;
    });
  }

  /// Sign in with google
  void googleSignInMethod() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;
    if (googleSignInAuthentication != null) {
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication!.idToken,
        accessToken: googleSignInAuthentication!.accessToken,
      );
      await _auth.signInWithCredential(credential).then((user) {
        Get.to(() => HomePage());
      });
    }
  }
}
