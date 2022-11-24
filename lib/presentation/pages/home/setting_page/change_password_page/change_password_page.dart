import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';

import '../../../../../app/util/app_colors.dart';

class ChangePasswordPage extends StatelessWidget {
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
                )

                // Align(
                //   alignment: Alignment.center,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text(
                //       "Personal Information",
                //       style: TextStyle(color: Colors.white, fontSize: 23),
                //     ),
                //   ),
                // ),
                ),
            SizedBox(
              height: 50,
            ),
            CustomInput(
              hint: "***************",
              lep: "your_old_password".tr,
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "***************",
              lep: "new_password".tr,
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "***************",
              lep: "confirme_your_password".tr,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                  text: 'change'.tr,
                  color: AppColors.secondryColor,
                  width: double.infinity,
                  // MediaQuery.of(context).size.width*.8,
                  hight: 40,
                  onClick: () {
                    Get.defaultDialog(
                        title: "confirmation".tr,
                        //  middleText: "Take a new phhoto or import one from your library",
                        contentPadding: EdgeInsets.all(8),
                        titlePadding: EdgeInsets.all(16),
                        titleStyle: TextStyle(color: Colors.black),
                        middleTextStyle: TextStyle(color: Colors.black),
                        textConfirm: "open_my_mailbox".tr,

                        //textCancel: "CAMERA",
                        //  cancelTextColor: Colors.blue,
                        confirmTextColor: Colors.blue,
                        buttonColor: Colors.white,
                        backgroundColor: Colors.white,
                        radius: 10,
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "open_your_mailbox_and_click_on_the_activation_link_in_the_message_you_received"
                                      .tr),
                            )
                          ],
                        ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
