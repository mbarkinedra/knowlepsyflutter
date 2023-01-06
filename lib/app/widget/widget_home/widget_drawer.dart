import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/data/networking/api/auth_api.dart';
import 'package:knowplesy/presentation/controllers/home_controller.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';

import '../../../data/networking/api/log_out_api.dart';
import '../../../presentation/pages/home/setting_page/personal_information_page/personal_information_page.dart';
import '../../storage/account_info_storage.dart';
import '../../storage/secure_storage.dart';

class WidgetDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.55,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          //  width: MediaQuery.of(context).size.width * 0.3, //70% of the screen
          child: Column(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  height: 100,
                  child: Center(
                    child: _buildDrawerItem(
                        icon: ImageIcon(
                            AssetImage("assets/images/icon_menu.png")),
                        isSelect:
                            Get.find<HomeController>().navigatorValue == 5,
                        onTap: () {},
                        label: "Menu"),
                  )),
              Expanded(child: _buildDrawerList()),
              Row(
                children: [
                  SecureStorage.readSecureData("imag") != null
                      ? GestureDetector(
                          onTap: () {
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
                  SizedBox(
                    width: 4,
                  ),
                  if (AccountInfoStorage.readToken() != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${AccountInfoStorage.readLastName()}"),
                        Text("${AccountInfoStorage.readFirstName()}"),
                      ],
                    )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await Get.find<AccountInfoStorage>().logout(context);
                  Get.defaultDialog(
                      title: "confirmation".tr,
                      //  middleText: "Take a new phhoto or import one from your library",
                      contentPadding: EdgeInsets.all(8),
                      titlePadding: EdgeInsets.all(16),
                      titleStyle: TextStyle(
                          color: AppColors.secondryColor,
                          fontWeight: FontWeight.bold),
                      middleTextStyle: TextStyle(color: Colors.black),
                      textCancel: "Cancel",
                      onCancel: () {
                        Navigator.of(context).pop(true);
                      },
                      textConfirm: "confirme".tr,
                      onConfirm: () {
                        Get.offAll(() => LoginPage());

                        //  clearData();
                      },
                      buttonColor: AppColors.secondryColor,
                      confirmTextColor: Colors.white,
                      cancelTextColor: AppColors.primaryColor,
                      backgroundColor: Colors.white,
                      radius: 10,
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Are you sure you want to exit this application?"),
                          )
                        ],
                      ));
                  ;
                },
                child: Text(
                  "logout".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerList() {
    return ListView(
      children: [
        Divider(
          thickness: 1,
          height: 1,
        ),
        _buildDrawerItem(
            isSelect: Get.find<HomeController>().navigatorValue == 0,
            label: 'home'.tr,
            icon: ImageIcon(AssetImage("assets/images/icon_home.png")),
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(0);
            }),
        _buildDrawerItem(
            icon: ImageIcon(AssetImage("assets/images/icon_seizure.png")),
            isSelect: Get.find<HomeController>().navigatorValue == 1,
            label: 'seizure'.tr,
            //  icon: CupertinoIcons.waveform_path,
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(1);
            }),
        _buildDrawerItem(
            isSelect: Get.find<HomeController>().navigatorValue == 2,
            icon: ImageIcon(AssetImage("assets/images/icon_medecine.png")),
            label: 'medecine'.tr,
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(2);
            }),
        _buildDrawerItem(
            icon: ImageIcon(AssetImage("assets/images/icon_settings.png")),
            isSelect: Get.find<HomeController>().navigatorValue == 3,
            label: 'setting'.tr,
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(3);
            }),
      ],
    );
  }

  _buildDrawerItem(
      {required String label,
      //required IconData icon,
      required ImageIcon icon,
      required VoidCallback onTap,
      required bool isSelect}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 43.0, left: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 34,
                  width: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ImageIcon(icon.image,
                      color: isSelect ? Colors.deepPurple : Colors.grey),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(label,
                      style: TextStyle(
                        color: isSelect ? Colors.deepPurple : Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:knowplesy/app/util/app_colors.dart';
// import 'package:knowplesy/data/networking/api/auth_api.dart';
// import 'package:knowplesy/presentation/controllers/home_controller.dart';
// import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
//
// import '../../../data/networking/api/log_out_api.dart';
// import '../../../presentation/controllers/seizure_controller/seizure_controller.dart';
// import '../../../presentation/pages/home/setting_page/personal_information_page/personal_information_page.dart';
// import '../../storage/account_info_storage.dart';
// import '../../storage/secure_storage.dart';
//
// class WidgetDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Drawer(
//         width: MediaQuery
//             .of(context)
//             .size
//             .width * 0.55,
//         backgroundColor: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           //  width: MediaQuery.of(context).size.width * 0.3, //70% of the screen
//           child: Column(
//             // padding: EdgeInsets.zero,
//             children: <Widget>[
//               Container(
//                   height: 100,
//                   child: Center(
//                     child: _buildDrawerItem(
//                         icon: ImageIcon(
//                             AssetImage("assets/images/icon_menu.png")),
//                         isSelect:
//                         Get
//                             .find<HomeController>()
//                             .navigatorValue == 5,
//                         onTap: () {},
//                         label: "Menu"),
//                   )),
//               Expanded(child: _buildDrawerList()),
//               Row(
//                 children: [
//                   SecureStorage.readSecureData("imag") != null
//                       ? GetBuilder<SeizureController>(builder: (logic) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context,) =>
//                                 PersonalInformationPage()));
//                       },
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             logic.getUserProfilejson!.data!
//                                 .imageUrl!),
//                         backgroundColor: Colors.deepPurple,
//                         maxRadius: 25,
//                       ),
//                     );
//                   })
//                       : CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "https://cdn-icons-png.flaticon.com/512/206/206881.png"),
//                     backgroundColor: Colors.deepPurple,
//                     maxRadius: 25,
//                   ),
//                   SizedBox(
//                     width: 4,
//                   ),
//                   if (AccountInfoStorage.readToken() != null)
//                     GetBuilder<SeizureController>(builder: (logic) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("${logic.getUserProfilejson!.data!
//                               .lastName}"),
//                           Text("${logic.getUserProfilejson!.data!
//                               .firstName}"),
//                         ],
//                       );
//                     })
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(
//                 thickness: 1,
//                 height: 1,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   await Get.find<AccountInfoStorage>().logout(context);
//                   Get.defaultDialog(
//                       title: "confirmation".tr,
//                       //  middleText: "Take a new phhoto or import one from your library",
//                       contentPadding: EdgeInsets.all(8),
//                       titlePadding: EdgeInsets.all(16),
//                       titleStyle: TextStyle(
//                           color: AppColors.secondryColor,
//                           fontWeight: FontWeight.bold),
//                       middleTextStyle: TextStyle(color: Colors.black),
//                       textCancel: "Cancel",
//                       onCancel: () {
//                         Navigator.of(context).pop(true);
//                       },
//                       textConfirm: "confirme".tr,
//                       onConfirm: () {
//                         Get.offAll(() => LoginPage());
//
//                         //  clearData();
//                       },
//                       buttonColor: AppColors.secondryColor,
//                       confirmTextColor: Colors.white,
//                       cancelTextColor: AppColors.primaryColor,
//                       backgroundColor: Colors.white,
//                       radius: 10,
//                       content: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                                 "Are you sure you want to exit this application?"),
//                           )
//                         ],
//                       ));
//                   ;
//                 },
//                 child: Text(
//                   "logout".tr,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Colors.deepPurple,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDrawerList() {
//     return ListView(
//       children: [
//         Divider(
//           thickness: 1,
//           height: 1,
//         ),
//         _buildDrawerItem(
//             isSelect: Get
//                 .find<HomeController>()
//                 .navigatorValue == 0,
//             label: 'home'.tr,
//             icon: ImageIcon(AssetImage("assets/images/icon_home.png")),
//             onTap: () {
//               Get.find<HomeController>().changeSelectedValue(0);
//             }),
//         _buildDrawerItem(
//             icon: ImageIcon(AssetImage("assets/images/icon_seizure.png")),
//             isSelect: Get
//                 .find<HomeController>()
//                 .navigatorValue == 1,
//             label: 'seizure'.tr,
//             //  icon: CupertinoIcons.waveform_path,
//             onTap: () {
//               Get.find<HomeController>().changeSelectedValue(1);
//             }),
//         _buildDrawerItem(
//             isSelect: Get
//                 .find<HomeController>()
//                 .navigatorValue == 2,
//             icon: ImageIcon(AssetImage("assets/images/icon_medecine.png")),
//             label: 'medecine'.tr,
//             onTap: () {
//               Get.find<HomeController>().changeSelectedValue(2);
//             }),
//         _buildDrawerItem(
//             icon: ImageIcon(AssetImage("assets/images/icon_settings.png")),
//             isSelect: Get
//                 .find<HomeController>()
//                 .navigatorValue == 3,
//             label: 'setting'.tr,
//             onTap: () {
//               Get.find<HomeController>().changeSelectedValue(3);
//             }),
//       ],
//     );
//   }
//
//   _buildDrawerItem({required String label,
//     //required IconData icon,
//     required ImageIcon icon,
//     required VoidCallback onTap,
//     required bool isSelect}) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 43.0, left: 8.0, top: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 34,
//                   width: 36,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: ImageIcon(icon.image,
//                       color: isSelect ? Colors.deepPurple : Colors.grey),
//                 ),
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//                   child: Text(label,
//                       style: TextStyle(
//                         color: isSelect ? Colors.deepPurple : Colors.grey,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 14.0,
//                       ),
//                       textAlign: TextAlign.left),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
