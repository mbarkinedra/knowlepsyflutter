import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:knowplesy/app/util/app_colors.dart';

import '../../../../../../app/widget/custom_button.dart';
import '../../../../../../app/widget/custom_input.dart';
import '../../../../../controllers/setting_controller/acces_control_controller/acces_control_controller.dart';

class AddCaregiver extends GetView<AccessControlController> {
  const AddCaregiver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    return Scaffold(
      body: Form(
        key: controller.caregiverKey,
        child: SingleChildScrollView(
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
                      Text("add_caregiver".tr,
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
                  validator: controller.validator.validateFirstName,
                  lep: "caregiver's_name".tr,
                  controller: controller.caregiverName,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 8,
              ),
              CustomInput(
                  validator: controller.validator.validateLastName,
                  lep: "Last_name".tr,
                  controller: controller.caregiverLastName,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 8,
              ),
              CustomInput(
                  validator: controller.validator.validateEmail,
                  controller: controller.email,
                  lep: "email".tr,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 8,
              ),
              // CustomInput(
              //   keyboardType: TextInputType.number,
              //   controller: controller.phoneNumber,
              //   lep: "phone_number".tr,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("phone".tr)),
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
                    text: 'add'.tr,
                    color: Colors.deepOrangeAccent,
                    width: MediaQuery.of(context).size.width * .8,
                    hight: 40,
                    onClick: () {
                      controller.validator.validationType = false;
                      if (!controller.caregiverKey.currentState!.validate()) {
                        ///if client validations fails
                        ///show a snackbar to fix the client errors.
                        Get.snackbar("Oups !",
                            "Merci de corriger les erreurs ci-dessous.",
                            backgroundColor: Colors.deepOrangeAccent,
                            colorText: Colors.white);
                        return;
                      }
                      controller.validator.validationType = true;
                      controller.addCaregiver();
                      Get.defaultDialog(
                          title: "Confirmation",
                          //  middleText: "Take a new phhoto or import one from your library",
                          contentPadding: EdgeInsets.all(8),
                          titlePadding: EdgeInsets.all(16),
                          titleStyle: TextStyle(color: Colors.black),
                          middleTextStyle: TextStyle(color: Colors.black),
                          textConfirm: "Confirm",
                          onConfirm: () {
                            Navigator.pop(context);
                            Get.back();
                            controller.clearAllData();
                          },
                          buttonColor: Colors.white,
                          backgroundColor: Colors.white,
                          radius: 10,
                          content: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "your_caregiver_will_receive_an_email_to_download_the_application_and_confirm_the_invitation_as_a_caregiver"
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
      ),
    );
  }
}
