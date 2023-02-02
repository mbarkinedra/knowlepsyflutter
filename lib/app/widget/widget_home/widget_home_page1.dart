import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/util/text_style.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/presentation/controllers/seizure_controller/seizure_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../presentation/controllers/home_controller.dart';

class WidgetHomePage1 extends GetView<SeizureController> {
  const WidgetHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlertBySeizure();
    controller.getFicheSeizure();
    controller.getNbrAlert();
    controller.getValueOfTempWithBlue();
    controller.getValueOfHeartWithBlue();
    String allData = "";
    controller.upDateTime();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .45,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                      "approved_seizure".tr,
                      style: BigTextStyle(),
                    )),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                    child: Container(
                      child: Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                  child: Stack(
                                      alignment: Alignment.center, children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                      ),
                                    ),
                                    GetBuilder<SeizureController>(
                                        builder: (logic) {
                                          return logic.getUserProfilejson ==
                                              null
                                              ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                              : Padding(
                                              padding: const EdgeInsets.all(
                                                  10.0),
                                              child: CircularPercentIndicator(
                                                radius: 40.0,
                                                lineWidth: 7,
                                                backgroundColor:
                                                Colors.blueAccent.withOpacity(
                                                    .3),
                                                percent: 2 / 4,
                                                animation: true,
                                                circularStrokeCap:
                                                CircularStrokeCap.round,
                                                center: Text(
                                                    "${logic.getUserProfilejson!
                                                        .data!
                                                        .trueAlert} \n seizure"
                                                        .tr,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: AppColors
                                                            .secondryColor,
                                                        fontWeight: FontWeight
                                                            .bold)),
                                                progressColor: AppColors
                                                    .secondryColor,
                                              ));
                                        })
                                  ]),
                                )),
                          ],
                        )
                      ]),
                    )),

                //  SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20, right: 40, left: 40),
                  child: CustomButton(
                    text: 'log_an_undetected_seizure_alert'.tr,
                    onClick: () {
                      controller.showMyDialog(context);
                    },
                    color: AppColors.secondryColor,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .8,
                    hight: 60,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: GetBuilder<HomeController>(builder: (logic) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                              (index) =>
                              Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                                  child: InkWell(
                                      onTap: () {
                                        logic.pageController!.animateToPage(
                                            index,
                                            duration:
                                            const Duration(milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 5,
                                        // check if a dot is connected to the current page
                                        // if true, give it a different color
                                        backgroundColor: logic.pageNumber ==
                                            index
                                            ? Colors.deepPurple
                                            : Colors.grey[400],
                                      ))),
                        ));
                  }),
                ),
                SizedBox(
                  height: 12,
                )
              ]),
            ),
            SizedBox(
              height: 12,
            ),
            GetBuilder<SeizureController>(builder: (logic) {
              return Container(
                  height: 200,
                  child: StreamBuilder<List<int>>(
                      stream: logic.stream,
                      builder: (context, data) {

                        print("the data from stream ${data.data}");

                        print("the data from stream ${utf8.decode(data.data ?? [])}");


                        if (data.connectionState == ConnectionState.active) {
                          var bb = utf8.decode(data.data ?? []);

                          allData = allData + bb;
                          print("0" * 50);
                          log("allData => $allData");
                          print("1" * 50);
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundImage:
                                    AssetImage("assets/images/herat.png"),
                                    backgroundColor: Colors.deepPurple,
                                    maxRadius: 35,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "heart",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 80,
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: StreamBuilder(
                                        stream: logic.device?.state,
                                        builder: (context, snapshotstate) {
                                          print(
                                              "objectsnapshotstate =>  ${snapshotstate
                                                  .data}");
                                          return Text(
                                            logic.characterist == null ||
                                                snapshotstate.data ==
                                                    BluetoothDeviceState
                                                        .disconnected
                                                ? "---"
                                                : "${logic
                                                .getValueOfHeartWithBlue()}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/temperature.png"),
                                  backgroundColor: Colors.deepPurple,
                                  maxRadius: 35,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Temperature",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 80,
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: StreamBuilder(
                                        stream: logic.device?.state,
                                        builder: (context, snapshotstate) {
                                          print(
                                              "objectsnapshotstate =>  ${snapshotstate
                                                  .data}");
                                          return Text(
                                            logic.characterist == null ||
                                                snapshotstate.data ==
                                                    BluetoothDeviceState
                                                        .disconnected
                                                ? "---"
                                                : "${logic
                                                .getValueOfTempWithBlue()}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      }));
            }),
          ],
        ),
      ),
    );
    ;
  }
}
