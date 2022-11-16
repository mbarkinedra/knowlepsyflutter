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
                    Text("Change password",
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
              lep: "Your old password",
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "***************",
              lep: "New password",
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "***************",
              lep: "Confirme your password",
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                  text: 'Change',
                  color: AppColors.secondryColor,
                  width: double.infinity,
                  // MediaQuery.of(context).size.width*.8,
                  hight: 40,
                  onClick: () {
                    Get.defaultDialog(
                        title: "Confirmation",
                        //  middleText: "Take a new phhoto or import one from your library",
                        contentPadding: EdgeInsets.all(8),
                        titlePadding: EdgeInsets.all(16),
                        titleStyle: TextStyle(color: Colors.black),
                        middleTextStyle: TextStyle(color: Colors.black),
                        textConfirm: "OPEN MY MAILBOX",

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
                                  "open your mailbox and click on the activation link in the message received"),
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
