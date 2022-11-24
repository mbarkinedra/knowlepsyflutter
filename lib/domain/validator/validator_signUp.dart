import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/domain/validator/validator_server.dart';

class ValidatorSignUp {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool validationType = false;
  ServerValidator validatorServer = ServerValidator();

  String validateName(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "Veuillez saisir votre nom";
      }
    } else {
      validatorServer.validate(value, 'name');
    }

    return "";
  }

  String validatePhone(String value) {
    if (!validationType) {
      if (value.isEmpty || value.length < 8) {
        return "Veuillez saisir votre numero de téléphone";
      }
    } else {
      //server
      return validatorServer.validate(value, 'phone');
    }
    return "";
  }

  String validateEmail(String value) {
    if (!validationType) {
      //client
      if (!GetUtils.isEmail(value)) {
        return "Veuillez saisir votre email";
      }
    } else {
      //server
      return validatorServer.validate(value, 'email');
    }
    return "";
  }

  String validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Veuillez saisir  votre mot de passe";
    }

    return "";
  }

  String validateCity(object) {
    if (object == null) {
      return " La ville est obligatoire";
    }
    return "";
  }
}
