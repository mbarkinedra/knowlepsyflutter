import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/domain/validator/validator_server.dart';

class ValidatorSignIn {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool validationType = false;
  ServerValidator validatorServer = ServerValidator();

  String validateEmail(String value) {
    if (!validationType) {
      if (!GetUtils.isEmail(value)) {
        return "Veuillez saisir votre email";
      }
    } else {
      return validatorServer.validate(value, 'email');
    }
    return "";
  }

  String validatePassword(String value) {
    if (!validationType) {
      if (value.isEmpty || value.length < 5) {
        return "Veuillez saisir  votre mot de passe";
      }
    } else {
      return validatorServer.validate(value, "password");
    }
    return "";
  }
}
