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
        return "Veuillez saisir votre nom";
      }
    } else {
     return validatorServer.validate(value, 'firstName');
    }

   return null;
  }
  String? validateLastName(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "Veuillez saisir votre nom";
      }
    } else {
      return   validatorServer.validate(value, 'lastName');
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
        return "Veuillez saisir votre email";
      }
    } else {
      //server
      return validatorServer.validate(value, 'email');
    }
    return null;
  }

  String? validatePassword(String value) {

      if (value!.isEmpty || value!.length < 6) {
        return "Veuillez saisir  votre mot de passe";
      }



    return null;
  }
  String? validatePassword1(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Veuillez saisir  votre mot de passe";
    }

    return null;
  }

}
