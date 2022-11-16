import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:flutter/services.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/CustomSettingBleutooth.dart';

import '../../../../app/widget/custom_setting.dart';
import 'BraceletConnected.dart';

class ConnectBleutoothScreen extends StatefulWidget {
  // ConnectBleutoothScreen({super.key});

  @override

  State<ConnectBleutoothScreen> createState() => _ConnectBleutoothScreenState();
}

class _ConnectBleutoothScreenState extends State<ConnectBleutoothScreen> {
  @override



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
                child: Image.asset("assets/images/connect02.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Nom de l’appareil',
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                        height: 1.0769230769230769,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * .3,
                    // ),
                    Spacer(),
                    Text(
                      'Nom de l’appareil',
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                        height: 1.0769230769230769,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 190,
              ),
              CustomSettingBleutooth(
                iconProfile: Icons.computer,
                text: "BRACELET-B2VA8MC",
                text1: "Sauvgarde",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (
                    context,
                  ) =>
                          BraceletConnected()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Align(
                  alignment: Alignment(-0.51, -0.151),
                  child: SizedBox(
                    width: 135.0,
                    height: 34.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 14,
                          color: Color(0xff000000),
                          height: 1.7777777777777777,
                        ),
                        children: [],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
