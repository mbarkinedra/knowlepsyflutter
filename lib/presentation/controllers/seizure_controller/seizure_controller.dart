import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../app/storage/account_info_storage.dart';
import '../../../data/networking/api/undetected_alert_api.dart';
import '../../../data/networking/json/add_undetected_alert_json.dart';
import '../../../data/networking/json/get_alert_byType_json.dart';
import '../../../data/networking/json/get_undetected_alert_json.dart';
import '../../../data/networking/json/user_json.dart';
import '../home_controller.dart';

class SeizureController extends GetxController {
  final AddUndetectedAlertApi _undetectedAlertApi = AddUndetectedAlertApi();
  final GetUndetectedAlertApi _getUndetectedAlertApi = GetUndetectedAlertApi();
  final DeleteUndetectedAlertApi _deleteUndetectedAlertApi =
      DeleteUndetectedAlertApi();
  final GetAlertByTypeApi _getAlertByTypeApi = GetAlertByTypeApi();
  UserJson? userJson;
  GetAlertByTypeJson? getAlertByTypeJson;
  TextEditingController comment = TextEditingController();
  DateTime dateTime = DateTime.now();

  // TimeOfDay? day;
  DateTime? focusedDay = DateTime.now();
  AddUndetectedAlertJson? addUndetectedAlertJson;
  GetUndetectedAlertJson? getUndetectedAlertJson;
  DateTime? selectedDay;
  TimeOfDay timeOfDay = TimeOfDay.now();

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
    print("Get all Undetected alert from server in screen home");
    _getUndetectedAlertApi.id = id;
    _getUndetectedAlertApi.secureGetData().then((value) {
      getUndetectedAlertJson = value as GetUndetectedAlertJson;
      print(getUndetectedAlertJson?.toJson());
      update();
    });
  }

  String id = "";

  @override
  void onInit() {
    super.onInit();
    id = AccountInfoStorage.readUserId() ?? "";
    print("the id it ===>     $id");
    //    controller.getUndetectedAlert();
  }

  /// get alert by type false or true from server
  getAlertByType() {
    _getAlertByTypeApi.secureGetData().then((value) {
     // getAlertByTypeJson = value as GetAlertByTypeJson;
      print(getUndetectedAlertJson?.toJson());

      // Alerts a=Alerts();
      // if( a.type ==1){
      //   Get.find<HomeController>().updatePageChaing(0);
      //   Get.find<HomeController>().initialPage = 0;
      // }else{
      //   Get.find<HomeController>().updatePageChaing(2);
      //   Get.find<HomeController>().initialPage = 2;
      // }

      update();
    });
  }

  ///  Create Undetected alert
  createUndetectedAlert(context) {
    Map<String, dynamic> data = {
      "comment": comment.text,
      "time": DateFormat('hh:mm a').format(dateTime).toString(),
      "date": focusedDay.toString(),
    };
    _undetectedAlertApi.securePost(dataToPost: data).then((value) {
      addUndetectedAlertJson = value as AddUndetectedAlertJson;
      print(addUndetectedAlertJson?.toJson());
      Get.find<HomeController>().changeSelectedValue(0);
      Get.find<HomeController>().updatePageChaing(1);
      Get.find<HomeController>().initialPage = 1;
      update();
    });
  }

  /// Get Undetected alert details
  getUndetectedAlertDetail() {}
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
                            backgroundImage: AssetImage("assets/images/avatar.png"),
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
                            backgroundImage: AssetImage("assets/images/avatar.png"),
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
                              offset: Offset(0, 3), // changes position of shadow
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
                              offset: Offset(0, 3), // changes position of shadow
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
      print(value);
      update();
    });
  }
}
