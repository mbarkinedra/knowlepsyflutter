import 'package:get/get.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';

import '../../app/storage/account_info_storage.dart';
import '../controllers/home_controller.dart';
import '../controllers/language/languageController.dart';
import '../controllers/medecine_controller/medecine_controller.dart';
import '../controllers/register_controller/register_controller.dart';
import '../controllers/reset_password_controller/reset_password_controller.dart';
import '../controllers/seizure_controller/seizure_controller.dart';
import '../controllers/setting_controller/acces_control_controller/acces_control_controller.dart';
import '../controllers/setting_controller/change_password_controller/change_password_controller.dart';
import '../controllers/setting_controller/personal_information_controller/personnal_information_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(AccountInfoStorage());

    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<RegisterController>(RegisterController());
    Get.put<MedecineController>(MedecineController());

    Get.put<HomeController>(HomeController());
    Get.put<PersonnelInformationController>(PersonnelInformationController());
    Get.put<SeizureController>(SeizureController());

    Get.put<LoginPasswordController>(LoginPasswordController());
    Get.put<LanguageController>(LanguageController());

    Get.put<AccessControlController>(AccessControlController());
    Get.put<ChangePasswordViewController>(ChangePasswordViewController());
  }
}
