import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';
import 'package:knowplesy/app/widget/custom_setting.dart';
import 'package:get/get.dart';

import '../../../../controllers/language/languageController.dart';

enum SingingCharacter { English, French }

class LanguagePage extends GetView<LanguageController> {
  // const LanguagePage({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(builder: (logic) {
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
                      Text("language".tr,
                          style: TextStyle(color: Colors.white, fontSize: 23)),
                      Spacer(),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              ListTile(
                dense: true,
                onTap: () {
             logic.updateToEnglish();
                },
                leading: Text("english".tr,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Radio(
                  value: SingingCharacter.English,
                  groupValue:logic. lan,
                  activeColor: Colors.green,
                  onChanged: (SingingCharacter? value) {

                    logic.updateToEnglish();
                  //  logic. lan = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                dense: true,
                onTap: () {
                  logic.updateToFrensh();

                },
                leading: Text(
                  "french".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Radio(
                  value: SingingCharacter.French,
                  groupValue: logic.lan,
                  activeColor: Colors.green,
                  onChanged: (SingingCharacter? value) {
                    logic.updateToFrensh();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
