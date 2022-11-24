import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';
import 'package:knowplesy/presentation/controllers/setting_controller/change_password_controller/change_password_controller.dart';

import '../../../../../app/util/app_colors.dart';
import '../../../../../app/widget/custom_password.dart';

class ChangePasswordPage extends GetView<ChangePasswordViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      // appBar: AppBar(elevation: 0, backgroundColor: AppColors.primaryColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text("change_password".tr,
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                    Spacer(),
                  ],
                )),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Changement de mot de passe:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<ChangePasswordViewController>(builder: (logic) {
              return ParametresItem(
                label: "Old password",
                hint: "Old Password",
                obscureText: logic.isVisiblePassword1,
                textEditingController: controller.oldPassword,
                // validator: (value) {
                //   return controller.validateServer.validate(value, 'password');
                // },
                suffixIcon: IconButton(
                  onPressed: logic.showHidePassword1,
                  icon: Icon(
                    logic.isVisiblePassword1
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              );
            }),
            SizedBox(
              height: 10,
            ),
            GetBuilder<ChangePasswordViewController>(builder: (logic) {
              return ParametresItem(
                label: "New Password",
                hint: "New password",
                obscureText: logic.isVisiblePassword2,
                textEditingController: controller.newPassword,
                // validator: (value) {
                //   return controller.validateServer.validate(value, 'password');
                // },
                suffixIcon: IconButton(
                  onPressed: logic.showHidePassword2,
                  icon: Icon(
                    logic.isVisiblePassword2
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              );
            }),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GetBuilder<ChangePasswordViewController>(builder: (logic) {
                  return CustomButton(
                    text: 'Change',
                    color: AppColors.secondryColor,
                    width: MediaQuery.of(context).size.width * .7,
                    // MediaQuery.of(context).size.width*.8,
                    hight: 40,
                    onClick: () {
                        controller.changePassword();

                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
