import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/config/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';

class PersonalInformationPage extends StatelessWidget {
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
                    GestureDetector(onTap: (){
                      Navigator.of(context).pop();
                    },child: Icon(Icons.arrow_back,color: Colors.white,)),
                    Spacer(),
                    Text("Personal Information",
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
              height: 10,
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
                  Positioned(
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
                            Icons.edit,
                            color: Colors.deepOrange,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CustomInput(
              lep: "Name :",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "Family Name :",
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
              lep: "Phone :",
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                  text: 'Confirme',
                  color: Colors.deepOrangeAccent,
                  width: double.infinity,
                  hight: 40,
                  onClick: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
