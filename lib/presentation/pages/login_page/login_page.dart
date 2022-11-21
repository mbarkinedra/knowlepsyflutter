import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';
import 'package:knowplesy/presentation/pages/register_page/register_page.dart';

import '../home/home_page/home_page.dart';
import '../home_page.dart';
import 'BleutoothScreen/BleutoothScreen1.dart';
import 'BleutoothScreen/BraceletNotConnected.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = Locale('en', 'US');
    Get.updateLocale(locale);
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                  child: Image.asset("assets/images/logo_knowlepsy.png"),
                ),

                CustomInputLogin(
                  lep: "email:".tr,
                  hint: "Exemple@gmail.com",
                ),
                SizedBox(
                  height: 18,
                ),
                CustomInputLogin(
                  lep: "Password :",
                  hint: "********",
                ),
                Align(
                  //  alignment: EdgeInsets.symmetric(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'I forgot my password',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: CustomButtonWithoutIcon(
                    text: 'Login ',
                    color: Colors.deepOrangeAccent,
                    width: MediaQuery.of(context).size.width * .8,
                    hight: 2,
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (
                        context,
                      ) =>
                              BleutoothScreen()));
                    },
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: CustomButton(
                    icon:
                        ImageIcon(AssetImage("assets/images/icon_google.png")),
                    text: 'Continue with google',
                    color: Colors.deepOrangeAccent,
                    width: double.infinity,
                    // MediaQuery.of(context).size.width*.8,
                    hight: 40,
                    onClick: () {},
                  ),
                ),
                // Row(
                //   children: [
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (
                        context,
                      ) =>
                              RegisterPage()));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don’t have an account? ",
                        // style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Sign-Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
