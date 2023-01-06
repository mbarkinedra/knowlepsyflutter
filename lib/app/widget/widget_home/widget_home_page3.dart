import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/util/text_style.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/widget_home/widget_drawer.dart';
import 'package:knowplesy/presentation/controllers/seizure_controller/seizure_controller.dart';
import 'package:knowplesy/presentation/controllers/setting_controller/personal_information_controller/personnal_information_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../presentation/controllers/home_controller.dart';
import '../../../presentation/pages/home/seizure_page/seizure_page.dart';

class WidgetHomePage3 extends GetView<SeizureController> {
  const WidgetHomePage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlertBySeizure();
    controller.getNbrAlert();

    return Scaffold(
      drawer: WidgetDrawer(),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
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
                  "false_alarm".tr,
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
                                      padding: const EdgeInsets.all(20.0),
                                      child: CircularPercentIndicator(
                                        radius: 40.0,
                                        lineWidth: 7,
                                        backgroundColor:
                                            Colors.blueAccent.withOpacity(.3),
                                        percent: 1 / 4,
                                        animation: true,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                            "${logic.getUserProfilejson!.data!.falseAlert}\n seizure"
                                                .tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.secondryColor,
                                                fontWeight: FontWeight.bold)),
                                        progressColor: AppColors.CerclePink,
                                      ));
                            }),
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
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (
                      //   context,
                      // ) =>
                      //         SeizurePage()));
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
                  height: 8,
                )
              ]),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Expanded(child: GetBuilder<SeizureController>(builder: (logic) {
            return logic.getAlertBySeizureJson == null
                //     ? Center(
                //   child: CircularProgressIndicator(),
                // )
                //     : logic.getAlertBySeizureJson!.data!.length == 0?Center(
                //   child: Column(
                //     children: [
                //       Image.asset(
                //         "assets/images/alert.png",
                //         width: 200,
                //         height: 150,
                //       ),
                //       Text("Still now alert yet"),
                //     ],
                //   ),
                // )
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (logic.getAlertBySeizureJson?.data?.length ?? 0) == 0
                    ? Center(
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
                            Text("Welcome to Knowlesy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey)),
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: logic.getAlertBySeizureJson!.data!.length,
                        itemBuilder: (context, index) {
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, pos) {
                                if (logic.getAlertBySeizureJson?.data?[index]
                                        .alerts?[pos].type !=
                                    0) {
                                  return SizedBox();
                                } else {
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
                                              color: Colors.purpleAccent,
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
                                                "false_alarm".tr,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].comment}",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey[500]),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                            " ${logic.getAlertBySeizureJson?.data?[index].alerts?[pos].createdAt?.substring(11, 16)}"),
                                      ],
                                    ),
                                  );
                                }
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
          }))
        ],
      ),
    );
    ;
  }
}
