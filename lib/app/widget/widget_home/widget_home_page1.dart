import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/util/text_style.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/widget_home/widget_drawer.dart';
import 'package:knowplesy/app/widget/widget_home/widget_home_page2.dart';
import 'package:knowplesy/presentation/controllers/seizure_controller/seizure_controller.dart';
import 'package:knowplesy/presentation/controllers/setting_controller/personal_information_controller/personnal_information_controller.dart';
import 'package:knowplesy/presentation/pages/home/seizure_page/seizure_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../presentation/controllers/home_controller.dart';
import '../custom_dialogue_delete.dart';

class WidgetHomePage1 extends GetView<SeizureController> {
  const WidgetHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlertBySeizure();
    controller.getFicheSeizure();
    controller.getNbrAlert();
    controller.upDateTime();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .45,
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
                          child: Stack(alignment: Alignment.center, children: [
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
                            GetBuilder<SeizureController>(builder: (logic) {
                              return logic.getUserProfilejson == null
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircularPercentIndicator(
                                        radius: 40.0,
                                        lineWidth: 7,
                                        backgroundColor:
                                            Colors.blueAccent.withOpacity(.3),
                                        percent: 2 / 4,
                                        animation: true,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                            "${logic.getUserProfilejson!.data!.trueAlert} \n seizure"
                                                .tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.secondryColor,
                                                fontWeight: FontWeight.bold)),
                                        progressColor: AppColors.secondryColor,
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
                    width: MediaQuery.of(context).size.width * .8,
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
                          (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                  onTap: () {
                                    logic.pageController!.animateToPage(index,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: CircleAvatar(
                                    radius: 5,
                                    // check if a dot is connected to the current page
                                    // if true, give it a different color
                                    backgroundColor: logic.pageNumber == index
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/herat.png"),
                        backgroundColor: Colors.deepPurple,
                        maxRadius: 35,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Heart Rate",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GetBuilder<SeizureController>(builder: (logic) {
                      return Container(
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
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                        logic.befor?    logic.getFicheSeizureByEmailJson?.data?.first
                                    ?.heartRate ??
                                "--":"--",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/temperature.png"),
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
                    GetBuilder<SeizureController>(builder: (logic) {
                      print(
                          "logic.getFicheSeizureByEmailJson?.data?.first?.temperature=>    ${logic.getFicheSeizureByEmailJson?.data?.first?.temperature}");
                      return Container(
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
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            logic.befor?   logic.getFicheSeizureByEmailJson?.data?.first
                                    ?.temperature ??
                                "--":"--",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            /*  Expanded(child: GetBuilder<SeizureController>(builder: (logic) {
              //    print("logic.ficheSeizureJson!.data!.lengthlogic.ficheSeizureJson!.data!.length   ${logic.ficheSeizureJson!.data!.length}");
              return logic.ficheSeizureJson == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : (logic.ficheSeizureJson?.data?.length ?? 0) == 0
                  ? Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Icon(
                        Icons.notifications_on_rounded,
                        size: 150,
                        color: Colors.deepPurple,
                      ),
                      Text("Still no detected alert  yet",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Welcome to Knowlepsy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey)),
                    ],
                  ),
                ),
              )
                  : ListView.separated(
                itemCount: logic.ficheSeizureJson!.data!.length,
                itemBuilder: (context, index) {
                  print("logic.ficheSeizureJson!.data!.length===... >${logic
                      .ficheSeizureJson!.data!.length}");
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, pos) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    shape: BoxShape.circle),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "FicheSeizure".tr,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    // Text(
                                    //   " ${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}",
                                    //   style: TextStyle(
                                    //       fontSize: 13,
                                    //       fontWeight:
                                    //           FontWeight.w600),
                                    // ),
                                    // Text(
                                    //   "${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].comment}",
                                    //   style: TextStyle(
                                    //       fontSize: 11,
                                    //       fontWeight: FontWeight.w600,
                                    //       color: Colors.grey[500]),
                                    // )
                                  ],
                                ),
                              ),
                              // Text(
                              //     " ${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}"),

                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      " ${logic.ficheSeizureJson?.data?[index]
                                          .createdAt?.substring(11, 16)}"),
                                  InkWell(
                                    onTap: () async {
                                      print(
                                          "${logic.ficheSeizureJson!.data![index]
                                              .id! }");
                                      logic.getFicheSeizureDetails(
                                        //  logic.getFicheSeizureDetailsJson!.data!.id!,
                                          logic.ficheSeizureJson!.data![index]
                                              .id!);
                                      // logic.id =
                                      //logic.getFicheSeizureDetailsJson!.data!.id!.toString();
                                      await showDialog<void>(
                                        context: context,
                                        //    barrierDismissible: false,
                                        // user must tap button!
                                        builder:
                                            (BuildContext context) {
                                          return AlertDialog(
                                            title: Image.asset(
                                              "assets/images/alert.png",
                                              width: 150,
                                              height: 120,
                                            ),
                                            content:
                                            SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Center(
                                                      child: Text(
                                                        "Seizure Alert Details",
                                                        style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      )),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Temperature",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              " ${logic
                                                                  .ficheSeizureJson
                                                                  ?.data?[index]
                                                                  .temperature}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "heart_rate",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              "${logic
                                                                  .ficheSeizureJson
                                                                  ?.data?[index]
                                                                  .heartRate}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "motion_sensing",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              "${logic
                                                                  .ficheSeizureJson
                                                                  ?.data?[index]
                                                                  .motionSensing}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(
                                                          context)
                                                          .pop(true);
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: MediaQuery
                                                          .of(
                                                          context)
                                                          .size
                                                          .width *
                                                          .2,
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors
                                                            .white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .grey
                                                                .withOpacity(
                                                                0.5),
                                                            spreadRadius:
                                                            2,
                                                            blurRadius:
                                                            7,
                                                            offset: Offset(
                                                                0,
                                                                3), // changes position of shadow
                                                          )
                                                        ],
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Image
                                                                .asset(
                                                                "assets/images/false_alert.png"),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[],
                                          );
                                        },
                                      );
                                    },
                                    child: const Icon(
                                        Icons
                                            .control_point_duplicate_rounded,
                                        size: 20,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: logic.getAlertBySeizureJson!
                          .data![index].alerts!.length);
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },

              );
            }))*/
            // Expanded(child: GetBuilder<SeizureController>(builder: (logic) {
            //   return logic.ficheSeizureJson == null
            //       ? Center(
            //           child: CircularProgressIndicator(),
            //         )
            //       : (logic.ficheSeizureJson?.data?.length ?? 0) ==
            //               0
            //           ? Center(
            //               child: SingleChildScrollView(
            //                 child: Column(
            //                   children: [
            //                     Icon(
            //                       Icons.notifications_on_rounded,
            //                       size: 150,
            //                       color: Colors.deepPurple,
            //                     ),
            //                     Text("Still no detected alert  yet",
            //                         style: TextStyle(
            //                             fontSize: 16, color: Colors.grey)),
            //                     SizedBox(
            //                       height: 20,
            //                     ),
            //                     Text("Welcome to Knowlepsy",
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 16,
            //                             color: Colors.grey)),
            //                   ],
            //                 ),
            //               ),
            //             )
            //           : ListView.separated(
            //               itemCount: logic.ficheSeizureJson!.data!.length,
            //               itemBuilder: (context, index) {
            //                 return ListView.separated(
            //                     shrinkWrap: true,
            //                     physics: NeverScrollableScrollPhysics(),
            //                     itemBuilder: (context, pos) {
            //                       if (logic.getAlertBySeizureJson?.data?[index]
            //                               .alerts?[pos].type !=
            //                           1) {
            //                         return SizedBox();
            //                       } else {
            //                         return Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Row(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.start,
            //                             children: [
            //                               Container(
            //                                 height: 15,
            //                                 width: 15,
            //                                 decoration: BoxDecoration(
            //                                     color: Colors.deepOrangeAccent,
            //                                     shape: BoxShape.circle),
            //                               ),
            //                               Expanded(
            //                                 child: Column(
            //                                   mainAxisAlignment:
            //                                       MainAxisAlignment.start,
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.start,
            //                                   children: [
            //                                     Text(
            //                                       "Temperature".tr,
            //                                       style: TextStyle(
            //                                           fontSize: 16,
            //                                           fontWeight:
            //                                               FontWeight.bold),
            //                                     ),
            //                                     Text(
            //                                       " ${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}",
            //                                       style: TextStyle(
            //                                           fontSize: 13,
            //                                           fontWeight:
            //                                               FontWeight.w600),
            //                                     ),
            //                                     Text(
            //                                       "${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].comment}",
            //                                       style: TextStyle(
            //                                           fontSize: 11,
            //                                           fontWeight: FontWeight.w600,
            //                                           color: Colors.grey[500]),
            //                                     )
            //                                   ],
            //                                 ),
            //                               ),
            //                               // Text(
            //                               //     " ${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}"),
            //
            //                               Column(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.end,
            //                                 crossAxisAlignment:
            //                                     CrossAxisAlignment.end,
            //                                 children: [
            //                                   Text(
            //                                       " ${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}"),
            //                                   InkWell(
            //                                     onTap: () async {
            //                                       await showDialog<void>(
            //                                         context: context,
            //                                         //    barrierDismissible: false,
            //                                         // user must tap button!
            //                                         builder:
            //                                             (BuildContext context) {
            //                                           return AlertDialog(
            //                                             title: Image.asset(
            //                                               "assets/images/alert.png",
            //                                               width: 150,
            //                                               height: 120,
            //                                             ),
            //                                             content:
            //                                                 SingleChildScrollView(
            //                                               child: ListBody(
            //                                                 children: <Widget>[
            //                                                   Center(
            //                                                       child: Text(
            //                                                     "Seizure Alert Details",
            //                                                     style: TextStyle(
            //                                                         fontSize: 23,
            //                                                         fontWeight:
            //                                                             FontWeight
            //                                                                 .bold),
            //                                                   )),
            //                                                   SizedBox(
            //                                                     height: 10,
            //                                                   ),
            //                                                   Column(
            //                                                     children: [
            //                                                       Center(
            //                                                         child: Row(
            //                                                           children: [
            //                                                             Text(
            //                                                               "Temperature",
            //                                                               style: TextStyle(
            //                                                                   fontSize:
            //                                                                       14,
            //                                                                   fontWeight:
            //                                                                       FontWeight.bold),
            //                                                             ),
            //                                                             Spacer(),
            //                                                             Text(
            //                                                               "${logic.ficheSeizureJson!.data![pos]}",
            //                                                               style: TextStyle(
            //                                                                   fontSize:
            //                                                                       14,
            //                                                                   fontWeight:
            //                                                                       FontWeight.bold),
            //                                                             ),
            //                                                           ],
            //                                                         ),
            //                                                       ),
            //                                                       Center(
            //                                                         child: Row(
            //                                                           children: [
            //                                                             Text(
            //                                                               "heart_rate",
            //                                                               style: TextStyle(
            //                                                                   fontSize:
            //                                                                       14,
            //                                                                   fontWeight:
            //                                                                       FontWeight.bold),
            //                                                             ),
            //                                                             Spacer(),
            //                                                             Text(
            //                                                               "${logic.ficheSeizureJson!.data![pos].heartRate}",
            //                                                               style: TextStyle(
            //                                                                   fontSize:
            //                                                                       14,
            //                                                                   fontWeight:
            //                                                                       FontWeight.bold),
            //                                                             ),
            //                                                           ],
            //                                                         ),
            //                                                       ),
            //                                                       Center(
            //                                                         child: Row(
            //                                                           children: [
            //                                                             Text(
            //                                                               "motion_sensing",
            //                                                               style: TextStyle(
            //                                                                   fontSize:
            //                                                                       14,
            //                                                                   fontWeight:
            //                                                                       FontWeight.bold),
            //                                                             ),
            //                                                             Spacer(),
            //                                                             Text(
            //                                                               "${logic.ficheSeizureJson!.data![pos].motionSensing}",
            //                                                               style: TextStyle(
            //                                                                   fontSize:
            //                                                                       14,
            //                                                                   fontWeight:
            //                                                                       FontWeight.bold),
            //                                                             ),
            //                                                           ],
            //                                                         ),
            //                                                       ),
            //                                                     ],
            //                                                   ),
            //                                                   SizedBox(
            //                                                     height: 15,
            //                                                   ),
            //                                                   GestureDetector(
            //                                                     onTap: () {
            //                                                       Navigator.of(
            //                                                               context)
            //                                                           .pop(true);
            //                                                     },
            //                                                     child: Container(
            //                                                       height: 50,
            //                                                       width: MediaQuery.of(
            //                                                                   context)
            //                                                               .size
            //                                                               .width *
            //                                                           .2,
            //                                                       decoration:
            //                                                           BoxDecoration(
            //                                                         color: Colors
            //                                                             .white,
            //                                                         borderRadius:
            //                                                             BorderRadius
            //                                                                 .circular(
            //                                                                     10),
            //                                                         boxShadow: [
            //                                                           BoxShadow(
            //                                                             color: Colors
            //                                                                 .grey
            //                                                                 .withOpacity(
            //                                                                     0.5),
            //                                                             spreadRadius:
            //                                                                 2,
            //                                                             blurRadius:
            //                                                                 7,
            //                                                             offset: Offset(
            //                                                                 0,
            //                                                                 3), // changes position of shadow
            //                                                           )
            //                                                         ],
            //                                                       ),
            //                                                       child: Column(
            //                                                         children: [
            //                                                           Center(
            //                                                             child: Image
            //                                                                 .asset(
            //                                                                     "assets/images/false_alert.png"),
            //                                                           ),
            //                                                         ],
            //                                                       ),
            //                                                     ),
            //                                                   )
            //                                                 ],
            //                                               ),
            //                                             ),
            //                                             actions: <Widget>[],
            //                                           );
            //                                         },
            //                                       );
            //                                     },
            //                                     child: const Icon(
            //                                         Icons
            //                                             .control_point_duplicate_rounded,
            //                                         size: 20,
            //                                         color: Colors.grey),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ],
            //                           ),
            //                         );
            //                       }
            //                     },
            //                     separatorBuilder: (context, index) {
            //                       return Divider();
            //                     },
            //                     itemCount: logic.getAlertBySeizureJson!
            //                         .data![index].alerts!.length);
            //               },
            //               separatorBuilder: (context, index) {
            //                 return Divider();
            //               },
            //             );
            // }))
          ],
        ),
      ),
    );
    ;
  }
}
