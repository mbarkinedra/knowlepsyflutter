import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:knowplesy/presentation/controllers/reset_password_controller/reset_password_controller.dart';

class ResetPassword extends GetView<LoginPasswordController> {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    //     backgroundColor: AppColors.primaryColor,
    //     body: Center(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Container(
    //             padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
    //             child: Image.asset(
    //               "assets/images/logo_knowlepsy.png",
    //               width: 200,
    //             ),
    //           ),
    //           // SizedBox(
    //           //   height: 30,
    //           // ),
    //           Align(
    //             child: TextButton(
    //               onPressed: () {},
    //               child: Text(
    //                 'Reset Password',
    //                 style: TextStyle(color: Colors.white, fontSize: 20),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           CustomInputLogin(
    //             lep: "Email ",
    //             hint: "johndoe@gmail.com",
    //           ),
    //           SizedBox(
    //             height: 18,
    //           ),
    //           CustomInputLogin(
    //             lep: "Enter New Password ",
    //             hint: ".............",
    //           ),
    //           SizedBox(
    //             height: 18,
    //           ),
    //           CustomInputLogin(
    //             lep: "Confirm your password",
    //             hint: ".............",
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           Center(
    //             child: CustomButtonWithoutIcon(
    //               text: 'Done ',
    //               color: Colors.deepOrangeAccent,
    //               width: double.infinity,
    //               // MediaQuery.of(context).size.width*.8,
    //               hight: 2,
    //               onClick: () {},
    //             ),
    //           ),
    //         ],
    //       ),
    // )
    );
  }
}
