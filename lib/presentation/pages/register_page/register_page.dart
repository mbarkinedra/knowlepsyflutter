import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';

import '../../../../../app/util/app_colors.dart';

const List<String> listcountry = <String>[
  'Tunsia',
  'India',
  'France',
  'Amercia'
];

class RegisterPage extends StatelessWidget {
  String dropdownValue = listcountry.first;

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
                                text: 'Welcome!\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Let\'s get started with creating your  \nknowlepsy account!',
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
                          ' Please enter the information \n of the person that will use knowlepsy bracelet.',
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
              lep: "Last name",
              hint: "Enter your last name",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "Email",
              hint: "Enter your email address",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
              lep: "Password ",
              hint: "Enter_password",
            ),
            SizedBox(
              height: 8,
            ),
            CustomInput(
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
                    "Country of Residence",
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
                        //     // This is called when the user selects an item.
                        //     // setState(() {
                        //     //   dropdownValue = value!;
                        //     // });
                      },

                      value: dropdownValue,
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: Text("City"),
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
                    "Day and month and year of birth",
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
                    child: TextField(
                      //controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.calendar_today,
                          color: AppColors.primaryColor,
                        ), //icon of text field
                        //labelText: "Enter Date" //label text of field
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
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          // setState(() {
                          //   dateInput.text =
                          //       formattedDate; //set output date to TextField value.
                          // });
                        } else {}
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CustomButton(
                        text: 'Create my account',
                        color: Colors.deepOrangeAccent,
                        width: double.infinity,
                        hight: 40,
                        onClick: () {
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
