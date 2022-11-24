import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';

import '../../../../../app/util/app_colors.dart';
import '../../../app/widget/login_item.dart';
import '../../controllers/register_controller/register_controller.dart';

const List<String> listcountry = <String>[
  'Tunsia',
  'India',
  'France',
  'Amercia'
];

class RegisterPage extends GetView<RegisterController> {
  String dropdownValue = listcountry.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BackgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 250,
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
                              TextSpan(
                                text:
                                    'lets_get_started_with_creating_your_knowlepsy_account'
                                        .tr,
                                style: TextStyle(
                                  color: const Color(0xfff2f7ff),
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
                            fontSize: 13,
                            color: const Color(0xfff2f7ff),
                          ),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                      ],
                    ),
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
            SizedBox(
              height: 25,
            ),
            CustomInput(
              controller: controller.firstName,
              lep: "First name",
              hint: "Enter your first name",
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              controller: controller.lastName,
              lep: "Last name",
              hint: "Enter your last name",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              controller: controller.email,
              lep: "Email",
              hint: "Enter your email address",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              controller: controller.password,
              lep: "Password ",
              hint: "Enter_password",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              controller: controller.confirmPassword,
              lep: "Confirm password",
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
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: Colors.black38)),
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.country.text = value!;
                      },

                      value: dropdownValue,
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: Text("city".tr),
                      iconSize: 24,
                      elevation: 16,
                      // onChanged: logic.updateCity,
                      items: listcountry
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
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
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: Colors.black38)),
                      child: TextField(
                        // enabled: false,
                        controller: controller.dateOfBirth,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            color: AppColors.primaryColor,
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
                  LogInItem(
                    textEditingController: controller.phoneNumber,
                    label: "N° de Téléphone",
                    //   hint: Environment.phonePlaceholder,
                    icon: Icons.add_call,
                    //  validator: controller.validator.validatePhone,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear_outlined),
                      onPressed: () {
                        controller.phoneNumber.clear();
                      },
                    ),
                    clearText: true,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CustomButton(
                        text: 'create_my_account'.tr,
                        color: Colors.deepOrangeAccent,
                        width: double.infinity,
                        hight: 40,
                        onClick: () {
                          controller.postRegister(context);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (
                            context,
                          ) =>
                                  LoginPage()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
