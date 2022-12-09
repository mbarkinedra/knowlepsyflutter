import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';

import '../../../app/config/app_routing.dart';
import '../../../app/storage/secure_storage.dart';
import '../../../data/networking/api/auth_api.dart';
import '../../../data/networking/json/simple_json_resource.dart';
import '../../../data/networking/json/user_json.dart';
import '../../../domain/validator/validator_signIn.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final UserApi _userApi = UserApi();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

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

      SecureStorage.writeSecureData(
          key: 'firstName', value: userJson!.user!.firstName!);

      SecureStorage.writeSecureData(key: 'token', value: userJson!.token!);
      SecureStorage.writeSecureData(
          key: 'nbr_undetectedAlert',
          value: userJson!.user!.nbrUndetectedAlert!.toString());
      SecureStorage.writeSecureData(
          key: 'trueAlert', value: userJson!.user!.trueAlert!.toString());
      SecureStorage.writeSecureData(
          key: 'falseAlert', value: userJson!.user!.falseAlert!.toString());

      Navigator.of(context).push(MaterialPageRoute(
          builder: (
        context,
      ) =>
              HomePage()));
    });
  }

  void googleSignInMethod() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    FirebaseAuth _auth = FirebaseAuth.instance;
    //   _googleSignIn.signOut();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
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

  loginWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null) {
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
                idToken: googleAuth.accessToken,
                accessToken: googleAuth.idToken))
            .then((value) {
          Get.snackbar("title", "message");
        });
        try {} on FirebaseException catch (e) {
        } catch (ee) {}
      }
    }
  }
}
