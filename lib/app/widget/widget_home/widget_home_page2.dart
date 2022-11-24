import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/util/text_style.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/widget_home/widget_drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../presentation/controllers/home_controller.dart';
import 'widget_home_page3.dart';

class widgetHomePage2 extends StatelessWidget {
  const widgetHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(children: [
              SizedBox(
                height: 30,
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
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 8,
                              backgroundColor:
                                  Colors.blueAccent.withOpacity(.3),
                              percent: 1 / 4,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text("2 \n seizure".tr.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.secondryColor,
                                      fontWeight: FontWeight.bold)),
                              progressColor: AppColors.CercleBlue,
                            ),
                          ),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (
                      context,
                    ) =>
                            SeizurePage()));
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
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: InkWell(
                                onTap: () {
                                  logic.pageController.animateToPage(index,
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
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: AppColors.CercleBlue, shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Convulsve senzure",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "15 sec",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "I whatching tv my favorite TV.....",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500]),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "3:20 AM",
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ))
        ],
      ),
    );
    ;
  }
}
