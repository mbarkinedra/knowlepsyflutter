import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/config/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:flutter/services.dart';

class ConnectBleutoothScreen extends StatefulWidget {
  // ConnectBleutoothScreen({super.key});
  late final String title;
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  final Map<Guid, List<int>> readValues = <Guid, List<int>>{};

  @override
  State<ConnectBleutoothScreen> createState() => _ConnectBleutoothScreenState();
}

class _ConnectBleutoothScreenState extends State<ConnectBleutoothScreen> {
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
                  child: Image.asset("assets/images/connect02.png"),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Nom de l’appareil',
                      style: TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 13,
                        color: Color(0xffffffff),
                        height: 1.0769230769230769,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                    SizedBox(
                      width: 190,
                    ),
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
                          children: [
                            TextSpan(
                              text: 'DESKTOP-B2VA8MC\n',
                            ),
                            TextSpan(
                              text: 'Sauvegardé',
                              style: TextStyle(
                                fontSize: 9,
                                color: Color(0xff999999),
                              ),
                            ),
                          ],
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
          ),
        ));
  }
}
