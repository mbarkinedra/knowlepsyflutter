import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/BraceletConnected.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/reset_password/reset_password.dart';
import 'package:knowplesy/presentation/pages/login_page/reset_password/reset_password_email.dart';
import 'package:knowplesy/presentation/pages/register_page/register_page.dart';

import '../home/home_page/home_page.dart';
import '../home_page.dart';
import 'BleutoothScreen/BraceletNotConnected.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Form(
            key: controller.LoginFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 20, 20, 100),
                    child: Image.asset("assets/images/logo_knowlepsy.png"),
                  ),
                  CustomInputLogin(
                    color: Colors.white,
                    icon: Icons.email,
                    label: "email".tr,
                    hint: "Exemple@gmail.com",
                    validator: controller.validator.validateEmail,
                    textEditingController: controller.emailController,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  GetBuilder<LoginController>(builder: (logic) {
                    return CustomInputLogin(
                      color: Colors.white,
                      icon: Icons.lock_outline,
                      label: "password".tr,
                      hint: "********",
                      obscureText: logic.isVisiblePassword,
                      validator: controller.validator.validatePassword,
                      textEditingController: controller.passwordController,
                      suffixIcon: IconButton(
                        onPressed: logic.showHidePassword,
                        icon: Icon(
                          color: Colors.white,
                          logic.isVisiblePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Align(
                      //  alignment: EdgeInsets.symmetric(8.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (
                            context,
                          ) =>
                                  ResetPasswordEmail()));
                        },
                        child: Text(
                          'i_forgot_my_password'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  GetBuilder<LoginController>(builder: (logic) {
                    return Center(
                      child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : CustomButtonWithoutIcon(
                              text: 'login'.tr,
                              color: Colors.deepOrangeAccent,
                              width: MediaQuery.of(context).size.width * .4,
                              hight: 50,
                              onClick: () async {
                                controller.validator.validationType = false;
                                if (!controller.LoginFormKey.currentState!
                                    .validate()) {
                                  //if client validations fails
                                  //show a snackbar to fix the client errors.
                                  Get.snackbar("Oups !",
                                      "Merci de corriger les erreurs ci-dessous.",
                                      colorText: Colors.white,
                                      backgroundColor: AppColors.secondryColor);
                                } else {
                                  controller.validator.validationType = true;
                                  //send data to server and get errors
                                  controller.login(context);
                                }
                              },
                            ),
                    );
                  }),
                  SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: CustomButton(
                      icon: ImageIcon(
                          AssetImage("assets/images/icon_google.png")),
                      text: 'Continue with google',
                      color: Colors.deepOrangeAccent,
                      width: MediaQuery.of(context).size.width * .4,
                      hight: 50,
                      onClick: () {
                        controller.googleSignInMethod();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                RegisterPage()));
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "dont_have_an_account".tr,
                          // style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'sign_up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
