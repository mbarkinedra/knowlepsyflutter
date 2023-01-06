import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowplesy/app/widget/widget_home/widget_home_page2.dart';
import 'package:knowplesy/data/networking/json/getuserprofilejson.dart';
import '../../../app/storage/account_info_storage.dart';
import '../../../app/util/app_colors.dart';
import '../../../data/networking/api/undetected_alert_api.dart';
import '../../../data/networking/json/add_undetected_alert_json.dart';
import '../../../data/networking/json/bracelet_json.dart';
import '../../../data/networking/json/fiche_seizure_json.dart';
import '../../../data/networking/json/getAlert_bySeizure_json.dart';
import '../../../data/networking/json/get_alert_byType_json.dart';
import '../../../data/networking/json/get_details_undetectedAlert_json.dart';
import '../../../data/networking/json/get_undetected_alert_json.dart';
import '../../../data/networking/json/update-undetectedAlert_json.dart';
import '../../../data/networking/json/user_json.dart';
import '../../../main.dart';
import '../../pages/home/seizure_page/seizure_page.dart';
import '../home_controller.dart';
import '../setting_controller/personal_information_controller/personnal_information_controller.dart';

class SeizureController extends GetxController {
  final AddUndetectedAlertApi _undetectedAlertApi = AddUndetectedAlertApi();
  final GetUndetectedAlertApi _getUndetectedAlertApi = GetUndetectedAlertApi();
  final UpdateUndetectedAlertApi _updateUndetectedAlertApi =
      UpdateUndetectedAlertApi();
  final GetDetailsUndetectedAlert _getDetailsUndetectedAlert =
      GetDetailsUndetectedAlert();
  final GetAlertBySeizureApi _getAlertBySeizureApi = GetAlertBySeizureApi();
  final DeleteUndetectedAlertApi _deleteUndetectedAlertApi =
      DeleteUndetectedAlertApi();
  final GetAlertByTypeApi _getAlertByTypeApi = GetAlertByTypeApi();
  final GetFicheSeizureApi _getFicheSeizureApi = GetFicheSeizureApi();
  UserJson? userJson;
  GetUserProfilejson? getUserProfilejson;
  GetAlertByTypeJson? getAlertByTypeJson;
  GetAlertBySeizureJson? getAlertBySeizureJson;
  GetUndetectedAlertDetailsJson? getUndetectedAlertDetailsJson;
  int idUndetectedAlert = 0;
  TextEditingController comment = TextEditingController();
  bool getAdsFromServer = false;

  DateTime dateTime = DateTime.now();
  UpdateUndetectedAlertJson? updateUndetectedAlertJson;
  FicheSeizureJson? ficheSeizureJson;
  BracletBleutoothJson? bracletBleutoothJson;

  // TimeOfDay? day;
  DateTime? focusedDay = DateTime.now();
  AddUndetectedAlertJson? addUndetectedAlertJson;
  GetUndetectedAlertJson? getUndetectedAlertJson;
  DateTime? selectedDay;
  TimeOfDay timeOfDay = TimeOfDay.now();
  bool isUpdate = false;

  clearData() {
    comment.text = "";
  }

  /// get Number Alert
  getNbrAlert() async {
    await Get.find<PersonnelInformationController>().getUserData();
    getUserProfilejson =
        Get.find<PersonnelInformationController>().getUserProfilejson;
    update();
  }

  ///show time picker method
  showMyTimePicker(context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      timeOfDay = value!;
      update();
    });
  }

  /// Get all Undetected alert from server in screen home
  getUndetectedAlert() {
    _getUndetectedAlertApi.id = id;
    _getUndetectedAlertApi.secureGetData().then((value) {
      getUndetectedAlertJson = value as GetUndetectedAlertJson;
      update();
    });
  }

  String id = "";

  @override
  void onInit() {
    super.onInit();
    id = AccountInfoStorage.readUserId() ?? "";
    //    controller.getUndetectedAlert();
  }

  /// get alert by type false or true from server
  // getAlertByType(int type) {
  //   _getAlertByTypeApi.type = type.toString();
  //   _getAlertByTypeApi.secureGetData().then((value) {
  //     getAlertByTypeJson = value as GetAlertByTypeJson;
  //
  //     Alerts a = Alerts();
  //     if (a.type == 1) {
  //       Get.find<HomeController>().updatePageChaing(0);
  //       Get.find<HomeController>().initialPage = 0;
  //     } else {
  //       Get.find<HomeController>().updatePageChaing(2);
  //       Get.find<HomeController>().initialPage = 2;
  //     }
  //
  //     update();
  //   });
  // }
  getAlertBySeizure() {
    print("object-----------------------------");
    _getAlertBySeizureApi.id = AccountInfoStorage.readUserId() ?? "";

    _getAlertBySeizureApi.secureGetData().then((value) {
      getAlertBySeizureJson = value as GetAlertBySeizureJson;
      print("hhhhhhhhhhhhhhhdddddddddddddddddddddddddde=>  $value");
      update();
    });
  }

  /// Get fiche seizure from apareil
  getFicheSeizure() {
    _getFicheSeizureApi.secureGetData().then((value) {
      ficheSeizureJson = value as FicheSeizureJson;
      update();
    });
  }

  ///  Create Undetected alert
  createUndetectedAlert() {
    Map<String, dynamic> data = {
      "comment": comment.text,
      "time": DateFormat('hh:mm a').format(dateTime).toString(),
      "date": focusedDay.toString(),
      "seizure_id": AccountInfoStorage.readUserId(),
    };

    _undetectedAlertApi.securePost(dataToPost: data).then((value) {
      //addUndetectedAlertJson = value as AddUndetectedAlertJson;
      Get.find<HomeController>().changeSelectedValue(0);
      Get.find<HomeController>().updatePageChaing(1);
      Get.find<HomeController>().initialPage = 1;
      clearData();
      update();
    });
  }

  updateUndetectedDetails() async {
    final f = new DateFormat('yyyy-MM-dd');

    Map<String, dynamic> data = {
      "id": idUndetectedAlert,
      "comment": comment.text,
      "time": DateFormat('hh:mm a').format(dateTime).toString(),
      "date": f.format(dateTime),
    };

    _updateUndetectedAlertApi.id = idUndetectedAlert.toString();
    _updateUndetectedAlertApi.securePost(dataToPost: data).then((value) {
      updateUndetectedAlertJson = value as UpdateUndetectedAlertJson;
      isUpdate = false;
      Get.find<HomeController>().changeSelectedValue(0);
      Get.find<HomeController>().updatePageChaing(1);
      Get.find<HomeController>().initialPage = 1;
      clearData();
    });
  }

  /// Get Undetected alert details

  getUndetectedAlertDetail(int id, context) async {
    _getDetailsUndetectedAlert.id = id.toString();
    await _getDetailsUndetectedAlert.secureGetData().then((value) async {
      getUndetectedAlertDetailsJson = value as GetUndetectedAlertDetailsJson;
      comment.text = getUndetectedAlertDetailsJson!.data!.comment!;
      // timeOfDay= getUndetectedAlertDetailsJson!.data!.time!;
      // dateTime= getUndetectedAlertDetailsJson!.data!.date!;
      Get.find<HomeController>().changeSelectedValue(1);
      // Get.find<HomeController>().initialPage = 1;
      //Navigator.of(context).push(MaterialPageRoute(
      //  builder: (
      // context,
      // ) =>
      //           SeizurePage()));
    });
  }

  showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      //    barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(
          Duration(seconds: 8),
          () {
            Navigator.of(context).pop(true);
          },
        );
        return AlertDialog(
          title: Image.asset(
            "assets/images/alert.png",
            width: 200,
            height: 150,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                    child: Text(
                  "Seizure Alert",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "If you Don't cancel the alert, the Following\n             Caregivers will be notified.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "08 secondes",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                            maxRadius: 30),
                        Text("Doctor"),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                            maxRadius: 30),
                        Text("Dad")
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeController>().updatePageChaing(0);
                        Get.find<HomeController>().initialPage = 0;
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset("assets/images/chek.png"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.find<HomeController>().updatePageChaing(2);
                        Get.find<HomeController>().initialPage = 2;
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ],
                        ),
                        child: Center(
                          child: Image.asset("assets/images/false_alert.png"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[],
        );
      },
    );
  }

  /// delete Undetected alert from server
  deleteUndetectedAlert({required DataAlert undetectedAlert}) {
    Map<String, dynamic> data = {"id": undetectedAlert.id};
    _deleteUndetectedAlertApi.secureDelete(data: data).then((value) {
      update();
    });
  }
}
