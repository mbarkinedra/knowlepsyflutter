import 'package:get/get.dart';
import 'package:knowplesy/presentation/controllers/login_controller/login_controller.dart';

import '../controllers/home_controller.dart';


class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());

    Get.put<HomeController>(HomeController());
  }
}