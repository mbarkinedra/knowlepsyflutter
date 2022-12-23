import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/presentation/controllers/reset_password_controller/reset_password_controller.dart';
import '../../../../app/widget/custom_input_reset_password.dart';

class ResetPasswordEmail extends GetView<LoginPasswordController> {
  const ResetPasswordEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Image.asset(
                  "assets/images/logo_knowlepsy.png",
                  width: 200,
                ),
              ),
              Align(
                child: Text(
                  'reset_password'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomInputResetPasswor(
                controller: controller.email,
                label: "email".tr,
                hint: "John@gmail.com",
              ),
              SizedBox(
                height: 30,
              ),
              GetBuilder<LoginPasswordController>(builder: (logic) {
                return Center(
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : CustomButtonWithoutIcon(
                          text: "continue".tr,
                          color: Colors.deepOrangeAccent,
                          width: MediaQuery.of(context).size.width * .7,
                          hight: 50,
                          onClick: () {
                            controller.resetPasswordWithCode(context);
                          },
                        ),
                );
              }),
            ],
          ),
        ));
  }
}
