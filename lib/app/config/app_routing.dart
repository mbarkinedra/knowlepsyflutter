//
//
// import 'package:get/get_navigation/src/routes/get_route.dart';
//
// import '../../presentation/bindings/bindings.dart';
//
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:knowplesy/presentation/pages/home/medecine_page/insert_medecine.dart';
import 'package:knowplesy/presentation/pages/home/medecine_page/medecine_page.dart';
import 'package:knowplesy/presentation/pages/home/seizure_page/seizure_page.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/access_control_page/access_control_page.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/access_control_page/add_caregiver/add_caregiver.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/change_password_page/change_password_page.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/personal_information_page/personal_information_page.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/setting_page.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/BraceletConnected.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/BraceletNotConnected.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/BraceletUnworn.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/Braceletdisconnected.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/reset_password/reset_password.dart';
import 'package:knowplesy/presentation/pages/register_page/register_page.dart';
import '../../presentation/bindings/bindings.dart';

class AppRouting {
  static String login = '/';
// home
  static String home = '/home';

//auth
  static String resetpassword = '/login/resetpassword';
  static String register = '/register';
//*connexion blue
  static String braceletdisconnected = '/login/braceletdisconnected';
  static String braceletconnected = '/login/braceletconnected';
  static String braceletnotconnected = '/login/braceletnotconnected';
  static String braceletnotnnworn = '/login/braceletnotnnworn';
  static String connectbleutoothscreen = '/login/connectbleutoothscreen';
//medicine
  static String insertmedecine = '/medicine/insertmedecine';
  static String medecine = '/medicine';

//seizure_page
  static String seizurepage = '/seizure';

//settings
  static String accesscontrolpage = '/settingpage/accesscontrolpage';
  static String changepasswordpage = '/settingpage/changepasswordpage';
  static String addcaregiver = '/settingpage/accesscontrolpage/addcaregiver';
  static String setting = '/setting';

  static String personalinformationpage =
      '/settingpage/personalinformationpage';

  // static String  = '/';

  // static String  = '/';

  // static String  = '/';

  // static String  = '/';

  // static String  = '/';

  // static String  = '/';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => HomePage(), binding: AllBindings()),
    GetPage(name: register, page: () => RegisterPage(), binding: AllBindings()),
    GetPage(
        name: braceletdisconnected,
        page: () => const Braceletdisconnected(),
        binding: AllBindings()),
    GetPage(
        name: braceletnotconnected,
        page: () => BraceletConnected(),
        binding: AllBindings()),
    GetPage(
        name: braceletnotconnected,
        page: () => BraceletNotConnected(),
        binding: AllBindings()),
    GetPage(
        name: braceletnotnnworn,
        page: () => BraceletUnworn(),
        binding: AllBindings()),
    GetPage(
        name: connectbleutoothscreen,
        page: () => ConnectBleutoothScreen(),
        binding: AllBindings()),
    GetPage(
        name: resetpassword,
        page: () => const ResetPassword(),
        binding: AllBindings()),
    GetPage(
        name: insertmedecine,
        page: () => const InsertMedecinePage(),
        binding: AllBindings()),
    GetPage(
        name: medecine,
        page: () =>  MedecinePage(),
        binding: AllBindings()),
    GetPage(
        name: seizurepage, page: () => SeizurePage(), binding: AllBindings()),
    GetPage(
        name: personalinformationpage,
        page: () => PersonalInformationPage(),
        binding: AllBindings()),
    GetPage(
        name: accesscontrolpage,
        page: () => const AccessControlPage(),
        binding: AllBindings()),
    GetPage(
        name: addcaregiver,
        page: () => const Addcaregiver(),
        binding: AllBindings()),
    GetPage(
        name: changepasswordpage,
        page: () => ChangePasswordPage(),
        binding: AllBindings()),
    GetPage(name: setting, page: () => SettingPage(), binding: AllBindings()),
  ];

  static GetPage getPageByName(String name) {
    return pages.firstWhere((p) => p.name == name);
  }

  static List<String> getPageNames() {
    List<String> names = <String>[];

    for (GetPage element in pages) {
      names.add(element.name);
    }
    return names;
  }
}
