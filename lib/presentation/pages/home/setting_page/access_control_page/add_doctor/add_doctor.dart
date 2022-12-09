import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:knowplesy/app/util/app_colors.dart';

import '../../../../../../app/widget/custom_button.dart';
import '../../../../../../app/widget/custom_input.dart';
import '../../../../../controllers/setting_controller/acces_control_controller/acces_control_controller.dart';
import '../access_control_page.dart';

class AddDoctorController extends GetView<AccesControlController> {
  const AddDoctorController({Key? key}) : super(key: key);

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
                    Text("Add a Doctor",
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
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomInput(
              lep: "Doctor's name  :",
              controller: controller.caregiverName,
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              controller: controller.email,
              lep: "Mail :",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              controller: controller.phoneNumber,
              lep: "Phone number :",
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                  text: 'add'.tr,
                  color: Colors.deepOrangeAccent,
                  width: double.infinity,
                  hight: 40,
                  onClick: () {
                    controller.addCaregiver(context);
                    Get.defaultDialog(
                        title: "Confirmation",
                        //  middleText: "Take a new phhoto or import one from your library",
                        contentPadding: EdgeInsets.all(8),
                        titlePadding: EdgeInsets.all(16),
                        titleStyle: TextStyle(color: Colors.black),
                        middleTextStyle: TextStyle(color: Colors.black),
                        textConfirm: "Confirm",
                        onConfirm: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (
                                  context,
                                  ) =>
                                  AccessControlPage()));
                          Get.back();
                        },
                        buttonColor: Colors.white,
                        backgroundColor: Colors.white,
                        radius: 10,
                        content: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Your Doctor will receive an email\nto download the application\nand confirm the invitation"),
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
