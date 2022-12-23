import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/presentation/controllers/setting_controller/change_password_controller/change_password_controller.dart';
import '../../../../../app/util/app_colors.dart';
import '../../../../../app/widget/custom_password.dart';

class ChangePasswordPage extends GetView<ChangePasswordViewController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
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
              padding: const EdgeInsets.all(25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "change_password".tr,
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<ChangePasswordViewController>(builder: (logic) {
              return ParametresItem(
                label: "old_password".tr,
                hint: "your_old_password".tr,
                obscureText: logic.isVisiblePassword1,
                textEditingController: controller.oldPassword,
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
                label: "new_password".tr,
                hint: "enter_new_password".tr,
                obscureText: logic.isVisiblePassword2,
                textEditingController: controller.newPassword,
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
                child:
                    GetBuilder<ChangePasswordViewController>(builder: (logic) {
                  return CustomButton(
                    text: 'Change',
                    color: AppColors.secondryColor,
                    width: MediaQuery.of(context).size.width * .7,
                    hight: 40,
                    onClick: () {
                      controller.changePassword(context);
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
