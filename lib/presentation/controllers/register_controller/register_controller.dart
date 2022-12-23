import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
import '../../../data/networking/api/sign_up_api.dart';
import '../../../domain/validator/validator_signUp.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final SignUpApi _userApi = SignUpApi();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  ValidatorSignUp validator = ValidatorSignUp();
  String? dropdownValue;
  bool isVisiblePassword = true;
  RxBool isLoading = false.obs;
  RxString globalErrors = ''.obs;

  void showHidePassword() {
    isVisiblePassword = !isVisiblePassword;

    update();
  }

  List<String> listcountry = <String>['Tunsia', 'India', 'France', 'Amercia'];

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
    dropdownValue = listcountry.first;
  }

  updateCountry(String? t) {
    dropdownValue = t;

    update();
  }

  desableIsLoading() {
    print(
        "object00000000000000000000000000000000000000000000000000000000000000000000000000000");
    isLoading.value = false;
    update();
  }

  clearData() {
    firstName.text = "";
    lastName.text = "";
    password.text = "";
    email.text = "";
    confirmPassword.text = "";
    dropdownValue = null;
    ;
    phoneNumber.text = "";
    dateOfBirth.text == "";

    update();
  }

  postRegister(context) async {
    isLoading.value = true;

    globalErrors.value = '';
    Map<String, dynamic> data = {
      "email": email.text,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "password": password.text,
      "password_confirmation": password.text,
      "date_of_birth": dateOfBirth.text,
      "phone_number": phoneNumber.text,
      "country": dropdownValue
    };
    _userApi.postData(data).then((value) {
      print("28888888888888888888888888888888");
      print(value);
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      // validator.validatorServer.validateServer(
      //     value: value,
      //     success: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => LoginPage()),
      //       );
      //     },
      //     failure: () {
      //       //validate server errors and show them in the form
      //       registerFormKey.currentState?.validate();
      //       Get.snackbar(
      //         'Erreur',
      //         'Veuillez corriger les erreurs ci-dessous.',
      //         colorText: Colors.white,
      //         backgroundColor: Colors.red,
      //       );
      //     });
      Get.defaultDialog(
          title: "confirmation".tr,
          //  middleText: "Take a new phhoto or import one from your library",
          contentPadding: EdgeInsets.all(8),
          titlePadding: EdgeInsets.all(16),
          titleStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          middleTextStyle: TextStyle(color: Colors.black),
          textConfirm: "confirme".tr,
          onConfirm: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            clearData();
          },
          buttonColor: Colors.white,
          backgroundColor: Colors.white,
          radius: 10,
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("You_received_on_your_email_an_activation_link".tr),
              )
            ],
          ));
    });
  }
}
