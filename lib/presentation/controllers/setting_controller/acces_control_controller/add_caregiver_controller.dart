import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../data/networking/api/careGiver_api.dart';
import '../../../../data/networking/api/sign_up_api.dart';
import '../../../../data/networking/json/careGiver_json.dart';
import '../../../pages/home/setting_page/access_control_page/access_control_page.dart';

class AddCaregiverController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final AddCareGiver _addCareGiveApi = AddCareGiver();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();

  CareGiverJson _careGiverJson = CareGiverJson();

  @override
  void onInit() {
    super.onInit();
  }

  RegisterCareGiver(context) async {
    Map<String, dynamic> data = {
      "email": email.text,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "phone_number": phoneNumber.text,
      // "country": country.text
    };
    _addCareGiveApi.securePost(dataToPost: data).then((value) {
      print("*" * 20);
      print(value);
      print("*" * 20);
      _careGiverJson = value as CareGiverJson;

      Navigator.of(context).push(MaterialPageRoute(
          builder: (
        context,
      ) =>
              AccessControlPage()));

      update();
    });
    update();
  }
}
