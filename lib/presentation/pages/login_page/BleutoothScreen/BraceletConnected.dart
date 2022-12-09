import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:flutter/services.dart';

import '../../home_page.dart';

class BraceletConnected extends StatefulWidget {
  // BraceletConnected({super.key});

  @override
  State<BraceletConnected> createState() => _BraceletConnectedState();
}

class _BraceletConnectedState extends State<BraceletConnected> {
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
                  child: Image.asset("assets/images/connect03.png"),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Image.asset("assets/images/connectsucces.png"),
                ),
                Align(
                  alignment: Alignment(0.012, 0.075),
                  child: SizedBox(
                    width: 134.0,
                    height: 90.0,
                    child: Text(
                      'bracelet_connected'.tr,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 23,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.005, 0.268),
                  child: SizedBox(
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                          height: 1.6923076923076923,
                        ),
                        children: [
                          TextSpan(
                            text: 'your_bracelet_is_connected_successfully'.tr,
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
                SizedBox(height: 18),
                Align(
                  alignment: Alignment(0.005, 0.268),
                  child: SizedBox(
                    width: 180.0,
                    height: 47.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 19,
                          color: const Color(0xffefff19),
                          height: 1.6923076923076923,
                        ),
                        children: [
                          TextSpan(
                            text: 'Bracelet-B2VA8MC\n',
                          ),
                          TextSpan(
                            text: 'connected'.tr,
                            style: TextStyle(
                              fontSize: 13,
                            ),
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
                SizedBox(height: 40),
                Align(
                  alignment: Alignment(0.134, 0.494),
                  child: SizedBox(
                    width: 223.0,
                    height: 52.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffff6819),
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.004, -0.088),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            height: 21.0,
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (
                                //   context,
                                // ) =>
                                //         HomePage()));
                              },
                              child: Text(
                                'go_home'.tr,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                  height: 1.0625,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
