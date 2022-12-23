import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/domain/validator/validator_server.dart';

class ValidatorSignIn {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool validationType = false;
  ServerValidator validatorServer = ServerValidator();


  String? validateEmail(String value) {
    if (!validationType) {
      //client
      if (!GetUtils.isEmail(value)) {
        return "please_enter_your_email".tr;
      }
    } else {
      //server
      return validatorServer.validate(value, 'email');
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value!.isEmpty || value!.length < 6) {
      return "please_insert_your_password".tr;
    }
  }
}
