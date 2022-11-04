import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/config/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Image.asset("assets/images/logo_knowlepsy.png"),
              ),
              CustomInput(
                lep: "Email :",
                hint: "email",
              ),
              SizedBox(
                height: 18,
              ),
              CustomInput(
                lep: "Password :",
                hint: "Password",
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
                  width: double.infinity,
                  // MediaQuery.of(context).size.width*.8,
                  hight: 2,
                  onClick: () {},
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: CustomButton(
                  icon: Icons.login,
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
                    //Get.toNamed(AppRouting.signUp);
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
        ));
  }
}
