import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowplesy/app/storage/account_info_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/data/networking/api/add_medication_api.dart';
import 'package:knowplesy/data/networking/api/reminder_api.dart';
import 'package:knowplesy/data/networking/json/get_reminderMe_json.dart';
import 'package:knowplesy/domain/validator/validator_medecine.dart';

import '../../../data/networking/json/add_state_medecation.dart';
import '../../../data/networking/json/get_medication_json.dart';
import '../../../data/networking/json/get_modif_medecation_json.dart';
import '../../../data/networking/json/medecation_json.dart';
import '../../../data/networking/json/reminder_json.dart';
import '../../../data/networking/json/update_medecation_json.dart';
import '../../../main.dart';
import '../../pages/home/medecine_page/insert_medecine.dart';
import '../../pages/home/medecine_page/medecine_page.dart';

class MedecineController extends GetxController {
  TextEditingController name = TextEditingController();
  DateTime time = DateTime.now();
  TextEditingController quantity = TextEditingController();
  TextEditingController dosage = TextEditingController();
  bool reminder = true;
  final AddMedicationApi _addMedicationApi = AddMedicationApi();
  final GetMedicationApi _getMedecationApi = GetMedicationApi();
  final AddReminderMeApi _addReminderMeApi = AddReminderMeApi();
  final GetReminderMeApi _getReminderMeApi = GetReminderMeApi();
  final AddStateMedecation _addStateMedecation = AddStateMedecation();
  final UpdateMedecationApi _updateMedecationApi = UpdateMedecationApi();
  final GetModifMedicationApi _getModifMedicationApi = GetModifMedicationApi();
  AddReminderJson? addReminderJson;
  GetReminderJson? getReminderJson;
  AddMedicationJson? addMedicationJson;
  GetMedecationJson? getMedecationJson;
  AddStateMedicationJson? addStateMedicationJson;
  UpdateMedecationsJson? updateMedecationsJson;
  GetModifMedecationsJson? getModifMedecationsJson;

  DateTime? selectedDay;
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool dataAdverts = false;
  DateTime dateNow = DateTime.now();
  ValidatorMedecation validator = ValidatorMedecation();
  GlobalKey<FormState>? formKey;
  final GlobalKey<FormState> medecineKey = GlobalKey();
  bool isUpdate = false;
  int idMedecine = 0;

  showMyTimePicker(context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) async {
      timeOfDay = value!;
      DateTime ff = DateTime.now();
      // TimeOfDay vv = TimeOfDay(hour: 10, minute: 50);
      dateNow =
          DateTime(ff.year, ff.month, ff.day, timeOfDay.hour, timeOfDay.minute);
      await AndroidAlarmManager.oneShotAt(dateNow, 123, printHello,
          alarmClock: true);

      update();
    });
  }

  ///Clear all data of insert medecine
  clearData() {
    name.text = "";
    quantity.text = "";
    dosage.text = "";
    update();
  }

  /// Add Medication seizure
  addMedication(context) async {
    final f = new DateFormat('yyyy-MM-dd');

    Map<String, dynamic> data = {
      "name": name.text,
      "quantity": quantity.text,
      "time": DateFormat('hh:mm').format(dateNow).toString(),
      "dosage": dosage.text,
      "seizure_id": AccountInfoStorage.readUserId(),
      "reminder_me": reminder ? 1 : 0,
      "date": f.format(dateTime),
    };
    _addMedicationApi.securePost(dataToPost: data).then((value) {
      addMedicationJson = value as AddMedicationJson;
      Get.defaultDialog(
          title: "confirmation".tr,
          //  middleText: "Take a new phhoto or import one from your library",
          contentPadding: EdgeInsets.all(8),
          titlePadding: EdgeInsets.all(16),
          titleStyle: TextStyle(
              color: AppColors.secondryColor, fontWeight: FontWeight.bold),
          middleTextStyle: TextStyle(color: Colors.black),
          textCancel: "Cancel",
          onCancel: () {
            Get.back();
          },
          textConfirm: "confirme".tr,
          onConfirm: () {
            Get.back();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (
              context,
            ) =>
                    MedecinePage()));

            clearData();
          },
          buttonColor: AppColors.secondryColor,
          confirmTextColor: Colors.white,
          cancelTextColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          radius: 10,
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Do you want add a medecine"),
              )
            ],
          ));
    });
  }

  /// Function to Change  Medication if you tape the card
  updateMedication(context) async {
    final f = new DateFormat('yyyy-MM-dd');

    Map<String, dynamic> data = {
      "id": idMedecine,
      "name": name.text,
      "quantity": quantity.text,
      "time": DateFormat('hh:mm').format(dateNow).toString(),
      "dosage": dosage.text,
      "seizure_id": AccountInfoStorage.readUserId(),
      "reminder_me": reminder ? 1 : 0,
      "date": f.format(dateTime),
    };
    _updateMedecationApi.id = idMedecine.toString();
    _updateMedecationApi.securePost(dataToPost: data).then((value) {
      Get.defaultDialog(
          title: "confirmation".tr,
          //  middleText: "Take a new phhoto or import one from your library",
          contentPadding: EdgeInsets.all(8),
          titlePadding: EdgeInsets.all(16),
          titleStyle: TextStyle(
              color: AppColors.secondryColor, fontWeight: FontWeight.bold),
          middleTextStyle: TextStyle(color: Colors.black),
          textCancel: "Cancel",
          onCancel: () {
            Get.back();
          },
          textConfirm: "confirme".tr,
          onConfirm: () {
            Get.back();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (
              context,
            ) =>
                    MedecinePage()));

            clearData();
          },
          buttonColor: AppColors.secondryColor,
          confirmTextColor: Colors.white,
          cancelTextColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          radius: 10,
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Do you want to update a medecine?"),
              )
            ],
          ));
    });
  }

  ///Update Reminder Me
  updateReminder(bool v) {
    reminder = v;
    update();
  }

  /// Get ALl medecation of seizure
  getMedecation() {
    _getMedecationApi.id = AccountInfoStorage.readUserId() ?? "";
    _getMedecationApi.secureGetData().then((value) {
      getMedecationJson = value as GetMedecationJson;
      update();
    });
  }

  /// Add Reminder  of medecine
  addReminderMe({required String medication_id, required String reminder_me}) {
    Map<String, dynamic> data = {
      "medication_id": medication_id,
      "reminder_me": reminder_me
    };

    _addReminderMeApi.securePost(dataToPost: data).then((value) {});
  }

  /// get Reminder  of medecine

  getReminderMe() {
    _getReminderMeApi.secureGetData().then((value) {
      getReminderJson = value as GetReminderJson;
      update();
    });
  }

  /// Add State Medecation (taken or Pendding)
  addStateMedecation({required String medication_id}) {
    Map<String, dynamic> data = {
      "medication_id": medication_id,
    };
    _addStateMedecation.id = medication_id;
    _addStateMedecation.securePost(dataToPost: data).then((value) {
      getMedecation();
    });
  }

  /// Get User information from server
  getAllData(int id, context) async {
    _getModifMedicationApi.id = id.toString();
    await _getModifMedicationApi.secureGetData().then((value) async {
      getModifMedecationsJson = value as GetModifMedecationsJson;
      name.text = getModifMedecationsJson!.data!.name!;
      quantity.text = getModifMedecationsJson!.data!.quantity!;
      dosage.text = getModifMedecationsJson!.data!.dosage!;
      reminder = getModifMedecationsJson!.data!.reminderMe == 0 ? true : false;
      print(
          "getModifMedecationsJson!.data!.reminderMe    =>...     ${getModifMedecationsJson!.data!.reminderMe}");

      Navigator.of(context).push(MaterialPageRoute(
          builder: (
        context,
      ) =>
              InsertMedecinePage()));
    });
  }
}
