import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:knowplesy/app/storage/secure_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/widget_home/widget_drawer.dart';
import 'package:knowplesy/app/widget/widget_home/widget_home_page3.dart';
import 'package:knowplesy/presentation/controllers/home_controller.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/personal_information_page/personal_information_page.dart';

import '../../../../app/widget/widget_home/widget_home_page1.dart';
import '../../../../app/widget/widget_home/widget_home_page2.dart';
import 'package:get/get.dart';

class HomePage1 extends StatefulWidget {
  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.pageController =
        PageController(initialPage: controller.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    //controller.pageController.jumpToPage(controller.initialPage);
    return Scaffold(
        drawer: WidgetDrawer(),
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.primaryColor,
          title: Row(
            children: [
              Text("${"hi".tr}${SecureStorage.readSecureData('firstName')}"),
              Spacer(),
              SecureStorage.readSecureData("imag") != null
                  ? GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (
                          context,
                          ) =>
                          PersonalInformationPage()));

                },
                    child: CircleAvatar(
                backgroundImage: NetworkImage(
                      SecureStorage.readSecureData("imag")!),
                backgroundColor: Colors.deepPurple,
                maxRadius: 25,
              ),
                  )
                  : CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/206/206881.png"),
                backgroundColor: Colors.deepPurple,
                maxRadius: 25,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (
              //       context,
              //     ) =>
              //             PersonalInformationPage()));
              //   },
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(8.0),
              //     child: Image.asset(
              //       "assets/images/avatar.png",
              //       width: 80,
              //       height: 50,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageChaing,
          children: const <Widget>[
            WidgetHomePage1(),
            WidgetHomePage2(),
            WidgetHomePage3()
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:knowplesy/app/config/app_colors.dart';
// import 'package:knowplesy/app/config/text_style.dart';
// import 'package:knowplesy/app/widget/custom_button.dart';
// import 'package:knowplesy/app/widget/widget_drawer.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// import 'home_page_2.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: WidgetDrawer(),
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: AppColors.primaryColor,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Hi,Nedra !",
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.asset(
//                 "assets/images/avatar.png",
//                 width: 80,
//                 height: 50,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * .5,
//             decoration: BoxDecoration(
//                 color: AppColors.primaryColor,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//             child: Column(children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                   child: Text(
//                 "APPROVED SEIZURE",
//                 style: TextStyle(
//                     fontSize: 21,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white),
//               )),
//               SizedBox(
//                 height: 8,
//               ),
//               Expanded(
//                   child: Container(
//                 child: Stack(children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           //Navigator.of(context).pop();
//                         },
//                         child: Icon(Icons.arrow_back_ios_new,
//                             size: 30, color: Colors.grey),
//                       ),
//                       Expanded(
//                           child: Container(
//                         child: Stack(alignment: Alignment.center, children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.deepPurpleAccent),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(30.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle, color: Colors.white),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(40.0),
//                             child: CircularPercentIndicator(
//                               radius: 50.0,
//                               lineWidth: 8,
//                               backgroundColor:
//                                   Colors.blueAccent.withOpacity(.3),
//                               percent: 2 / 4,
//                               animation: true,
//                               circularStrokeCap: CircularStrokeCap.round,
//                               center: Text("2 \n Seizur".toString(),
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: AppColors.secondryColor,
//                                       fontWeight: FontWeight.bold)),
//                               progressColor: AppColors.secondryColor,
//                             ),
//                           ),
//                         ]),
//                       )),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (
//                             context,
//                           ) =>
//                                   HomePage2()));
//                         },
//                         child: Icon(Icons.arrow_forward_ios,
//                             size: 30, color: Colors.grey),
//                       )
//                     ],
//                   )
//                 ]),
//               )),
//
//               //  SizedBox(height: 20,),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20.0, bottom: 20, right: 40, left: 40),
//                 child: CustomButton(
//                   text: 'Log an undetected Seizure Alert',
//                   onClick: () {},
//                   hight: 40,
//                   color: Colors.deepOrangeAccent,
//                   width: double.infinity,
//                 ),
//               )
//             ]),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Expanded(
//               child: ListView.separated(
//             itemCount: 50,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 15,
//                       width: 15,
//                       decoration: BoxDecoration(
//                           color: Colors.deepOrangeAccent,
//                           shape: BoxShape.circle),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Convulsve senzure",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             "15 sec",
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.w600),
//                           ),
//                           Text(
//                             "I whatching tv my favorite TV.....",
//                             style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey[500]),
//                           )
//                         ],
//                       ),
//                     ),
//                     Text(
//                       "3:20 AM",
//                     ),
//                   ],
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return Divider();
//             },
//           ))
//         ],
//       ),
//     );
//     ;
//   }
// }
