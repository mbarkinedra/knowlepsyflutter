import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/domain/validator/validator_server.dart';

class ValidatorSignUp {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool validationType = false;
  ServerValidator validatorServer = ServerValidator();

  String? validateFirstName(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "please_enter_your_first_name".tr;
      }
    } else {
      return validatorServer.validate(value, 'firstName');
    }

    return null;
  }

  String? validateLastName(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "please_enter_your_last_name".tr;
      }
    } else {
      return validatorServer.validate(value, 'lastName');
    }

    return null;
  }

  String? validatePhone(String value) {
    if (!validationType) {
      if (value.isEmpty || value.length < 8) {
        return "Veuillez saisir votre numero de téléphone";
      }
    } else {
      return validatorServer.validate(value, 'phoneNumber');
    }
    return null;
  }

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

    return null;
  }

  String? validatePassword1(String value) {
    if (value.isEmpty || value.length < 6) {
      return "please_insert_your_password".tr;
    }

    return null;
  }
}
