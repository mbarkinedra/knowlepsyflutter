import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/util/text_style.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/widget_home/widget_drawer.dart';
import 'package:knowplesy/presentation/controllers/seizure_controller/seizure_controller.dart';
import 'package:knowplesy/presentation/pages/home/seizure_page/seizure_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../presentation/controllers/home_controller.dart';
import '../../storage/account_info_storage.dart';
import '../custom_dialogue_delete.dart';
import 'widget_home_page3.dart';

class WidgetHomePage2 extends GetView<SeizureController> {
  const WidgetHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUndetectedAlert();
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
                  "undetected_seizure".tr,
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
                                        percent: 1 / 4,
                                        animation: true,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                          "${logic.getUserProfilejson!.data!.nbrUndetectedAlert} \n seizure"
                                              .tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.secondryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        progressColor: AppColors.CercleBlue,
                                      ),
                                    );
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
            height: 10,
          ),
          Expanded(child: GetBuilder<SeizureController>(builder: (logic) {
            return logic.getUndetectedAlertJson == null
                // ? Center(
                //     child: CircularProgressIndicator(),
                //   )
                // : logic.getUndetectedAlertJson!.data!.length == 0
                // ? Center(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         SizedBox(
                //           height: 175,
                //         ),
                //         const Align(
                //           alignment: Alignment.topCenter,
                //           child: Text("Still now alert yet",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 16,
                //                   color: Colors.grey)),
                //         ),
                //       ],
                //     ),
                //   )
                ? Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.notifications_on_rounded,
                          size: 150,
                          color: Colors.deepPurple,
                        ),
                        Text("Still no undetected alert  yet",
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
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
                : Card(
                    child: ListView.separated(
                      itemCount: logic.getUndetectedAlertJson!.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.isUpdate = true;
                            print(
                                "hhhhhhhhhhhhhhhh ${logic.idUndetectedAlert}");
                            logic.getUndetectedAlertDetail(
                                logic.getUndetectedAlertJson!.data![index].id!,
                                context);
                            logic.idUndetectedAlert =
                                logic.getUndetectedAlertJson!.data![index].id!;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: AppColors.CercleBlue,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "convulsive_seizure".tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${logic.getUndetectedAlertJson?.data?[index].time}",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${logic.getUndetectedAlertJson?.data?[index].comment}",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[500]),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        "${logic.getUndetectedAlertJson?.data?[index].time}"),
                                    InkWell(
                                      onTap: () async {
                                        await showDialog<bool>(
                                            context: context,
                                            builder: (context) {
                                              return CustomDialogueDelete(
                                                okFunction: () async {
                                                  controller.deleteUndetectedAlert(
                                                      undetectedAlert: logic
                                                          .getUndetectedAlertJson!
                                                          .data![index]);
                                                  logic.getUndetectedAlertJson!
                                                      .data!
                                                      .remove(logic
                                                          .getUndetectedAlertJson!
                                                          .data![index]);
                                                  logic.update();
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                text2: " ",
                                                title: "Confirmation",
                                                function: () async {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                buttonText2: "Cancel",
                                                description:
                                                    "Are you sure you want to delete your ad?",
                                                buttonText: "Ok",
                                                phone: false,
                                              );
                                            });
                                      },
                                      child: const Icon(Icons.delete,
                                          size: 20, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    ),
                  );
          }))
        ],
      ),
    );
    ;
  }
}
