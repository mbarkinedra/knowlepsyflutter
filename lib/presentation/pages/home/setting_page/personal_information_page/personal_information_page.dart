import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();

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
                    Text("personal_information".tr,
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
                            title: "take_photo".tr,
                            //  middleText: "Take a new phhoto or import one from your library",
                            contentPadding: EdgeInsets.all(8),
                            titlePadding: EdgeInsets.all(16),
                            titleStyle: TextStyle(color: Colors.black),
                            middleTextStyle: TextStyle(color: Colors.black),
                            textConfirm: "gallery".tr,
                            textCancel: "camera".tr,
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
                                      "take_a_new_photo_or_import_one_from_your_library"
                                          .tr),
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
              lep: "name".tr,
              hint: "Nedra",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "family_name".tr,
              hint: "Mbarki",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "email".tr,
              hint: "Nedrambarki@gmail.com",
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft, child: Text("phone".tr)),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        IntlPhoneField(
                          decoration: InputDecoration(
                            hintText: 'phone_number'.tr,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(26),
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'TN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                  text: 'confirme'.tr,
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
