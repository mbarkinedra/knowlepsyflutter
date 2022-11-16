import 'package:flutter/material.dart';
import 'package:knowplesy/app/util/text_style.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/change_password_page/change_password_page.dart';

import '../../../../app/util/app_colors.dart';
import '../../../../app/widget/custom_setting.dart';
import 'access_control_page/access_control_page.dart';
import 'language_page/language_page.dart';
import 'personal_information_page/personal_information_page.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: WidgetDrawer(),
      //appBar: AppBar(elevation: 0, backgroundColor: AppColors.backgroundColor),
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
              child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Setting",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
            ),

            CustomSetting(
              iconProfile: Icons.perm_identity,
              text: "Personal Information",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        PersonalInformationPage()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16),
              child: Divider(
                height: 1,
                color: Colors.grey,
                thickness: 1,
              ),
            ),


            CustomSetting(
              iconProfile: Icons.lock_outlined,
              text: "Change password",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        ChangePasswordPage()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16),
              child: Divider(
                height: 1,
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            CustomSetting(
              iconProfile: Icons.miscellaneous_services_outlined,
              text: "Access and control",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        AccessControlPage()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16),
              child: Divider(
                height: 1,
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            CustomSetting(
              iconProfile: Icons.language,
              text: "Language",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        LanguagePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
