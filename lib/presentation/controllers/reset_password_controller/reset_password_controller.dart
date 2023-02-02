import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../data/networking/api/forgot password_api.dart';
import '../../pages/login_page/reset_password/reset_password.dart';

class LoginPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController code = TextEditingController();
  final ForgotPasswordWithCodeApi forgotPasswordApi =
      ForgotPasswordWithCodeApi();
  final VerifyCodePassword _verifyCodePassword = VerifyCodePassword();
  final ResetPasswordWithCodeApi _resetPasswordWithCodeApi =
      ResetPasswordWithCodeApi();
  TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  ///Reset Password With Code
  resetPasswordWithCode(context) {
    isLoading.value = true;
    forgotPasswordApi.postData({"email": email.text}).then((value) {
      isLoading.value = false;

      showDialog<void>(
        context: context,
        //    barrierDismissible: false,
        // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Confirmation",
              style: TextStyle(fontSize: 15),
            )),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                      child: Text(
                    "Enter the code activation in the\n message you received on your mail",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    // key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,

                          // obscuringWidget: const FlutterLogo(
                          //   size: 24,
                          // ),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "I'm from validator";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            selectedColor: AppColors.primaryColor,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          //  animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: false,
                          //  errorAnimationController: errorController,
                          controller: code,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },

                          onChanged: (value) {
                            debugPrint(value);
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      _verifyCodePassword.postData({
                        "email": email.text,
                        "code": code.text
                      }).then((value) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                ResetPassword()));
                        update();
                      });
                    },
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                        color: AppColors.secondryColor,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: [],
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Send",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[],
          );
        },
      );
    });
  }

  /// Reset Password
  resetPassword() {
    isLoading.value = true;

    _resetPasswordWithCodeApi.postData(
        {"email": email.text, "newPassword": newPassword.text}).then((value) {
      isLoading.value = false;
    });
  }
}
