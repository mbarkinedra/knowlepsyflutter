import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';

import 'ConnectBleutoothScreen.dart';

class Braceletdisconnected extends StatefulWidget {
  const Braceletdisconnected({super.key});

  @override
  State<Braceletdisconnected> createState() => _BleutoothScreenState();
}

class _BleutoothScreenState extends State<Braceletdisconnected> {
  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset("assets/images/connect01.png"),
                ),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                //   child: Image.asset("assets/images/exclamation.png"),
                // ),
                // Container(
                //   child: Align(
                //     alignment: Alignment(0.012, 0.075),
                //     child: SizedBox(
                //       child: Text(
                //         'bracelet_connected'.tr,
                //         style: TextStyle(
                //           fontFamily: 'Roboto',
                //           fontSize: 23,
                //           color: const Color(0xffffffff),
                //           fontWeight: FontWeight.w700,
                //         ),
                //         textAlign: TextAlign.center,
                //         softWrap: false,
                //       ),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment(0.005, 0.268),
                  child: SizedBox(
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 19,
                          color: Color.fromARGB(255, 255, 255, 255),
                          height: 1.6923076923076923,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Please connect your bracelet \nto your Bluetooth',
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: CustomButtonWithoutIcon(
                    text: 'connect_with_bluetooth'.tr,
                    color: Colors.deepOrangeAccent,
                    width: MediaQuery.of(context).size.width * .7,
                    hight: 50,
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (
                        context,
                      ) =>
                              BluetoothPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
