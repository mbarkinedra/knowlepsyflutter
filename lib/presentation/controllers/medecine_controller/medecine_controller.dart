import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/data/networking/api/add_medication_api.dart';

import '../../../data/networking/json/get_medication_json.dart';
import '../../pages/home/medecine_page/medecine_page.dart';

class MedecineController extends GetxController {
  TextEditingController name = TextEditingController();
  DateTime time = DateTime.now();
  TextEditingController quantity = TextEditingController();

  TextEditingController dosage = TextEditingController();

  //TextEditingController type = TextEditingController();
  String? type_dosage ;
  String? type_quantity ;

  final AddMedicationApi _addMedicationApi = AddMedicationApi();
  final GetMedicationApi _getMedecationApi = GetMedicationApi();
  GetMedecationJson? getMedecationJson;
  DateTime? selectedDay;
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();

  showMyTimePicker(context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      timeOfDay = value!;
      update();
    });
  }

  /// Add Medication seizure
  addMedication(context) {
    var date = dateTime.microsecondsSinceEpoch;
    Map<String, dynamic> data = {
      "name": name.text,
      "quantity": quantity.text,
      "time": DateFormat('hh:mm a').format(dateTime).toString(),
      "dosage": dosage.text,
      "type_dosage": type_dosage,
      "type_quantity": type_quantity,
      "seizure_id": AccountInfoStorage.readUserId(),
    };
    _addMedicationApi.securePost(dataToPost: data).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (
        context,
      ) =>
              MedecinePage()));
      update();
    });
  }

  getMedecation() {
    _getMedecationApi.secureGetData().then((value) {
      print(value);
      getMedecationJson = value as GetMedecationJson;
      update();
    });
  }
}
