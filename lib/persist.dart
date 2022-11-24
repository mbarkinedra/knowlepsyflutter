//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:knowplesy/presentation/pages/home_page.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// import 'app/config/app_routing.dart';
// import 'app/storage/account_info_storage.dart';
//
//
//
// class PersistentTabManager {
//   static PersistentTabController tabController =
//   PersistentTabController(initialIndex: 0);
//
//   static List<Widget>? screens;
//
//   static RxInt currentIndex = 0.obs;
//
//   static final pages = <String>[
//     AppRouting.home,
//     AppRouting.login,
//
//   ];
//
//   static void changePage(int index) {
//     currentIndex.value = index;
//     tabController.index = index;
//     tabController.jumpToTab(index);
//     Get.routing.current = pages[index];
//     //Get.toNamed(pages[index]);
//     //tabController.jumpToTab(index);
//   }
// ايه الفكره اصلا من ده
//   static void initScreens() => screens = buildScreens();
//
//   static void updateScreens() => PersistentTabManager.screens = buildScreens();
//
//   static List<Widget> buildScreens() {
//     bool isLoggedIn = Get.find<AccountInfoStorage>().isLoggedIn();
//     return [
//       HomePage(),
//       // isLoggedIn ? MyAdsView() : SignInScr(),
//       // isLoggedIn ? TapPublishScr() : SignInScr(),
//       // isLoggedIn ? TapChatScr() : SignInScr(),
//       // isLoggedIn ? TapProfileScr() : SignInScr()
//     ];
//   }
//
//   /// a custom fucntion to remove evrything and go to home
//   // static goToHome(BuildContext context) {
//   //   Navigator.pushAndRemoveUntil(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => const MainView(),
//   //       ),
//   //           (route) => false);
//   // }
//
//   // static goToLoginPage(BuildContext context){
//   //   goToHome(context);
//   //   changePage(4);
//   // }
// }
