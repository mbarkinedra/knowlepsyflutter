import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/domain/validator/validator_server.dart';

class ValidatorMedecation {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool validationType = false;
  ServerValidator validatorServer = ServerValidator();

  String? validateName(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "please_enter_your_medecine_name".tr;
      }
    } else {
      return validatorServer.validate(value, 'name');
    }

    return null;
  }
  String? validateDosage(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "please_fill_in_the_dosage".tr;
      }
      int? parsedValue = int.tryParse(value);
      if (parsedValue == null) return "Please_enter_a_number".tr;
      if (parsedValue < 1) return "dosage_must_be_greater_than_0".tr;
      return null;
    } else {
      return validatorServer.validate(value, 'dosage');
    }
    return null;
  }
  String? validateQuantity(String value) {
    if (!validationType) {
      if (value.isEmpty) {
        return "please_fill_in_the_quantity".tr;
      }
      int? parsedValue = int.tryParse(value);
      if (parsedValue == null) return "Please_enter_a_number".tr;
      if (parsedValue < 1) return  "quantity_must_be_greater_than_0".tr;
    } else {
      return validatorServer.validate(value, 'quantity');
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value!.isEmpty || value!.length < 6) {
      return "Veuillez saisir  votre mot de passe";
    }
  }
}
