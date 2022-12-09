import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';

import '../../../../controllers/setting_controller/personal_information_controller/personnal_information_controller.dart';

class PersonalInformationPage extends GetView<PersonnalInformationController> {
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
                ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<PersonnalInformationController>(builder: (logic) {
              return Container(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: controller.pickImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22.0),
                        child: controller.img != null
                            ?
                        CircleAvatar(maxRadius: 60,backgroundImage: FileImage(controller.img!,),)
                            : Image.asset(
                                "assets/images/avatar.png",
                                width: 150,
                                height: 110,
                              ),
                      ),
                    ),
                    Positioned(
                      top: -5,
                      right: -2,
                      child: GestureDetector(
                        onTap: () {
                          controller.pickImage();
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
              );
            }),
            SizedBox(
              height: 25,
            ),
            CustomInput(
                lep: "Name :", hint: "", controller: controller.firstName),
            SizedBox(
              height: 8,
            ),
            CustomInput(
                lep: "Family Name :",
                hint: "",
                controller: controller.lastName),
            SizedBox(
              height: 8,
            ),
            CustomInput(lep: "Email :", hint: "", controller: controller.email,des: false),
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
                              hintText: '',
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
                            controller: controller.phoneNumber),
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
                  onClick: () {
                    controller.updateUserData();
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
