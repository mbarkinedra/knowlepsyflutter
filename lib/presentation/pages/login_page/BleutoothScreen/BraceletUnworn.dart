import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:flutter/services.dart';

class BraceletUnworn extends StatefulWidget {
  @override
  State<BraceletUnworn> createState() => _BraceletNotConnectedState();
}

class _BraceletNotConnectedState extends State<BraceletUnworn> {
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
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Image.asset("assets/images/connectnotsucces.png"),
                ),
                Align(
                  alignment: Alignment(0.012, 0.075),
                  child: SizedBox(
                    width: 134.0,
                    height: 90.0,
                    child: Text(
                      'unworn_bracelet'.tr,
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
                            text:
                                'please_wear_your_bracelet_and_reconnect_it'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
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
              ],
            ),
          ),
        ));
  }
}
