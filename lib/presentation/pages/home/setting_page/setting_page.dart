import 'package:flutter/material.dart';
import 'package:knowplesy/app/config/text_style.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/change_password_page/change_password_page.dart';

import '../../../../app/config/app_colors.dart';
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
      body: Column(
        children: [
          /*   Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Annonce détaillée",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),*/
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
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
          /*   Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalInformationPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Personal information",),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),*/
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
          /*  Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.lock_outlined),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Change password"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),*/
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
          /*       Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.miscellaneous_services_outlined),
                SizedBox(
                  width: 20,
                ),
                Text("Access and control"),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),*/
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
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Icon(Icons.language),
          //       SizedBox(
          //         width: 16,
          //       ),
          //       Text("Language"),
          //       Spacer(),
          //       Icon(Icons.arrow_forward_ios),
          //     ],
          //   ),
          // ),
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
    );
  }
}
