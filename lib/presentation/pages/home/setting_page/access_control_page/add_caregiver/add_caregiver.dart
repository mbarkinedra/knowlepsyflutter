import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:knowplesy/app/util/app_colors.dart';

import '../../../../../../app/widget/custom_button.dart';
import '../../../../../../app/widget/custom_input.dart';

class Addcaregiver extends StatelessWidget {
  const Addcaregiver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Spacer(),
                    Text("Add Caregiver",
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                    Spacer(),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/images/avatar.png",
                      width: 150,
                      height: 110,
                    ),
                  ),
/*                  Positioned(
                    top: -2,
                    right: -2,
                    child: GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            title: "Take photo",
                            //  middleText: "Take a new phhoto or import one from your library",
                            contentPadding: EdgeInsets.all(8),
                            titlePadding: EdgeInsets.all(16),
                            titleStyle: TextStyle(color: Colors.black),
                            middleTextStyle: TextStyle(color: Colors.black),
                            textConfirm: "GALLERY",
                            textCancel: "CAMERA",
                            cancelTextColor: Colors.blue,
                            confirmTextColor: Colors.blue,
                            buttonColor: Colors.white,
                            backgroundColor: Colors.white,
                            radius: 10,
                            content: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Take a new photo or import one from your library"),
                                )
                              ],
                            ));
                      },
                      child: Container(
                          width: 90,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            color: Colors.deepOrange,
                          )),
                    ),
                  )*/
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              lep: "Name :",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "Email :",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "Phone number :",
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                  text: 'Add',
                  color: Colors.deepOrangeAccent,
                  width: double.infinity,
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
                        //   confirmTextColor: Colors.blue,
                        buttonColor: Colors.white,
                        backgroundColor: Colors.white,
                        radius: 10,
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Your caregiver will receive an email to download the application and confirm the invitation as a caregiver"),
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
