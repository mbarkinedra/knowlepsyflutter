import 'package:get/get.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';

import '../../app/storage/account_info_storage.dart';
import '../controllers/home_controller.dart';
import '../controllers/register_controller/register_controller.dart';
import '../controllers/setting_controller/acces_control_controller/add_caregiver_controller.dart';
import '../controllers/setting_controller/change_password_controller/change_password_controller.dart';
import '../controllers/setting_controller/personal_information_controller/personnal_information_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() async {

    Get.put( AccountInfoStorage());


    Get.put<LoginController>(LoginController());
    Get.put<RegisterController>(RegisterController());

    Get.put<HomeController>(HomeController());
    Get.lazyPut(() => PersonnalInformationController());


    Get.put<AddCaregiverController>(AddCaregiverController());
    Get.put<ChangePasswordViewController>(ChangePasswordViewController());




  }
}
