import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
import '../../../../../app/util/app_colors.dart';
import '../../../app/widget/custom_register.dart';
import '../../controllers/register_controller/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BackgroundColor,
        body: Form(
          key: controller.registerFormKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(LoginPage());
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: const Color(0xffffea58),
                              ),
                              children: [
                                TextSpan(
                                  text: 'welcome'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            'please_enter_the_information_of_the_person_that_will_use_knowlepsy_bracelet'
                                .tr,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: const Color(0xfff2f7ff),
                            ),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 25,
              ),
              CustomRegister(
                validator: controller.validator.validateFirstName,
                controller: controller.firstName,
                label: "First name",
                hint: "Enter your first name",
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              CustomRegister(
                validator: controller.validator.validateLastName,
                controller: controller.lastName,
                label: "Last name",
                hint: "Enter your last name",
              ),
              SizedBox(
                height: 8,
              ),
              CustomRegister(
                validator: controller.validator.validateEmail,
                controller: controller.email,
                label: "Email",
                hint: "Enter your email address",
              ),
              SizedBox(
                height: 8,
              ),
              CustomRegister(
                validator: controller.validator.validatePassword,
                controller: controller.password,
                label: "Password ",
                hint: "Enter_password",
              ),
              SizedBox(
                height: 8,
              ),
              CustomRegister(
                validator: controller.validator.validatePassword1,
                controller: controller.confirmPassword,
                label: "Confirm password",
                hint: "Confirm password",
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "country_of_residence".tr,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: Colors.black38)),
                      child: GetBuilder<RegisterController>(builder: (logic) {
                        return DropdownButton<String>(
                          onChanged: (String? value) {
                            logic.dropdownValue = value;
                            logic.update();
                          },

                          value: logic.dropdownValue,
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: Text("city".tr),
                          iconSize: 24,
                          elevation: 16,
                          // onChanged: logic.updateCity,
                          items: logic.listcountry
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Day of birth",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GetBuilder<RegisterController>(builder: (logic) {
                      return Container(
                        // padding: const EdgeInsets.only(left: 30.0, right: 30),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(color: Colors.black38)),
                        child: TextField(
                          // enabled: false,
                          controller: controller.dateOfBirth,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.calendar_today,
                                color: AppColors.primaryColor,
                              ),
                            ), //icon of text field
                            border: InputBorder.none,
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              controller.dateOfBirth.text = formattedDate;
                              print(formattedDate);

                              logic.update();
                            } else {}
                          },
                        ),
                      );
                    }),
                    Column(
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
                                    print(
                                        'Country changed to: ' + country.name);
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
                    Obx(() {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: AppColors.secondryColor,
                                  strokeWidth: 5,
                                )
                              : CustomButton(
                                  text: 'create_my_account'.tr,
                                  color: Colors.deepOrangeAccent,
                                  width: double.infinity,
                                  hight: 40,
                                  onClick: () {
                                    controller.validator.validationType = false;
                                    if (!controller.registerFormKey.currentState!
                                        .validate()) {
                                      ///if client validations fails
                                      ///show a snackbar to fix the client errors.
                                      Get.snackbar("Oups !",
                                          "please_correct_the_errors_below".tr,
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          colorText: Colors.white);
                                      return;
                                    }
                                    controller.validator.validationType = true;
                                    //send data to server and get errors
                                    controller.postRegister(context);
                                  },
                                ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
