import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knowplesy/data/networking/json/getuserprofilejson.dart';
import '../../../app/storage/account_info_storage.dart';
import '../../../data/networking/api/undetected_alert_api.dart';
import '../../../data/networking/json/add_undetected_alert_json.dart';
import '../../../data/networking/json/bracelet_json.dart';
import '../../../data/networking/json/fiche_seizure_json.dart';
import '../../../data/networking/json/getAlert_bySeizure_json.dart';
import '../../../data/networking/json/getFicheSeizureByEmail_json.dart';
import '../../../data/networking/json/getFicheSeizureDetails_json.dart';
import '../../../data/networking/json/get_alert_byType_json.dart';
import '../../../data/networking/json/get_details_undetectedAlert_json.dart';
import '../../../data/networking/json/get_undetected_alert_json.dart';
import '../../../data/networking/json/update-undetectedAlert_json.dart';
import '../../../data/networking/json/user_json.dart';
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
  final GetFicheSeizureByEmailApi _getFicheSeizureByEmailApi =
  GetFicheSeizureByEmailApi();
  final GetFicheSeizureDetailsApi _getFicheSeizureDetailsApi =
  GetFicheSeizureDetailsApi();
  final Map<Guid, List<int>> readValues = <Guid, List<int>>{};
  UserJson? userJson;
  GetUserProfilejson? getUserProfilejson;
  GetAlertByTypeJson? getAlertByTypeJson;
  GetAlertBySeizureJson? getAlertBySeizureJson;
  GetUndetectedAlertDetailsJson? getUndetectedAlertDetailsJson;
  int idUndetectedAlert = 0;
  TextEditingController comment = TextEditingController();
  bool getAdsFromServer = false;
  RxInt time = 5.obs;
  DateTime dateNow = DateTime.now();

  bool befor = true;
  int secondsAdd = 30;
  int befor_diff = 0;
  String temp_time = "";
  String heart_time = "";
  BluetoothDevice? device;
  DateTime mytime = DateTime.now();
  DateTime dateTime = DateTime.now();
  UpdateUndetectedAlertJson? updateUndetectedAlertJson;
  GetFicheSeizureListJson? ficheSeizureJson;
  BracletBleutoothJson? bracletBleutoothJson;
  GetFicheSeizureByEmailJson? getFicheSeizureByEmailJson;

  // TimeOfDay? day;
  DateTime? focusedDay = DateTime.now();
  AddUndetectedAlertJson? addUndetectedAlertJson;
  GetUndetectedAlertJson? getUndetectedAlertJson;
  GetFicheSeizureDetailsJson? getFicheSeizureDetailsJson;
  DateTime? selectedDay;
  TimeOfDay timeOfDay = TimeOfDay.now();
  bool isUpdate = false;
  String? temperature;

  clearData() {
    comment.text = "";
  }

  Stream<List<int>>? stream;
  bool ruun = true;

  BluetoothCharacteristic? characterist;

  getdevice(BluetoothDevice device) {
    this.device = device;
  }

  ///Get Data From Bluetooth
  dataBluetooth({required service, dev}) async {
    this.device = dev;

    for (BluetoothService service in service) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        String data = '{"request":"data","action":"GET"}';
        print("characteristic=========>$characteristic");
        if (characteristic.properties.read) {
          var sub = characteristic.value.listen((value) {
            readValues[characteristic.uuid] = value;
          });
          await characteristic.read();
          sub.cancel();
        }

        if (characteristic.properties.write) {
          while (ruun) {
            await Future.delayed(Duration(seconds: (3)));
            await characteristic.write(utf8.encode(data));
          }
        }
        if (characteristic.properties.notify) {
          characteristic.value.listen((value) async {
            characterist = characteristic;

            // readValues[characteristic.uuid] = value;
            final decoded = utf8.decode(value);
            DataParser(decoded);
            log("decoded all Data $decoded");
            stream = characterist!.value;
            print("the divceois    =>${device?.name}");
            // stream.sink.add(value);
          });
          await characteristic.setNotifyValue(true);
        }
      }
    }
  }


String convertData(List<int> dataFromDevice) {
  return utf8.decode(dataFromDevice);
}

upDateTime() async {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    time.value--;

    if (time.value == 0) {
      getFicheSeizureByEmail(AccountInfoStorage.readEmail()!);

      time.value = 10;
    }
    if (time.value == 5) {
      befor = false;
    }
  }
}

///DataParser Heart and Temperature
DataParser(String data) {
  if (data.isNotEmpty) {
    RegExp heart = RegExp(r'PPG\":\[\"[0-9]+\.[0-9]+');
    RegExpMatch? rege = heart.firstMatch(data);
    var heartValue = rege
        ?.group(0)
        ?.split(":")
        ?.last
        ?.replaceAll("[", "")
        ?.replaceAll("]", "")
        .replaceAll("\"", "") ??
        "";
    ;
    RegExp temp = RegExp(r'TEMP\":\[\"[0-9]+\.[0-9]+');
    RegExpMatch? regetEMP = temp.firstMatch(data);
    var tempValue = regetEMP
        ?.group(0)
        ?.split(":")
        ?.last
        ?.replaceAll("[", "")
        ?.replaceAll("]", "")
        .replaceAll("\"", "") ??
        "";
    ;

    if (tempValue != "") {
      this.temp_time = tempValue;
    }
    if (tempValue != "") {
      this.heart_time = heartValue;
    }
    getValueOfTempWithBlue();
    getValueOfHeartWithBlue();

    temperature = tempValue + "'C'";
  }
}

///Get Value of Temperature from Bluetooth
getValueOfTempWithBlue() {
  print("temp_time =====> ${temp_time}");

  return this.temp_time;
}

///Get Value of heart from Bluetooth
getValueOfHeartWithBlue() {
  return this.heart_time;
}

/// update Time of server with appareil when you connect with wifi
/// get Number Alert
getNbrAlert() async {
  await Get.find<PersonnelInformationController>().getUserData();
  getUserProfilejson =
      Get
          .find<PersonnelInformationController>()
          .getUserProfilejson;
  update();
}

///show time picker method
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
}

getAlertBySeizure() {
  _getAlertBySeizureApi.id = AccountInfoStorage.readUserId() ?? "";
  _getAlertBySeizureApi.secureGetData().then((value) {
    getAlertBySeizureJson = value as GetAlertBySeizureJson;
    update();
  });
}

/// Get fiche seizure from apareil
getFicheSeizure() {
  _getFicheSeizureApi.secureGetData().then((value) {
    ficheSeizureJson = value as GetFicheSeizureListJson;
    update();
  });
}

/// Get fiche seizure from details by email
getFicheSeizureByEmail(String email) {
  _getFicheSeizureByEmailApi.email = email;
  _getFicheSeizureByEmailApi.secureGetData().then((value) {
    getFicheSeizureByEmailJson = value as GetFicheSeizureByEmailJson;
    if (befor_diff < 30) {
      befor = true;
      update();
    } else {
      befor = false;
      update();
    }
  });
}

///Fuction to get same time of server and apareil
getTimeInSameTime() {
  var now = DateTime.now();
  var month = now.month.toString().padLeft(2, '0');
  var day = now.day.toString().padLeft(2, '0');
  var hour = now.hour.toString().padLeft(2, '0');
  var minute = now.minute.toString().padLeft(2, '0');
  var second = now.second.toString().padLeft(2, '0');
  var text = '${now.year}-$month-$day ${hour}:${minute}:${second}';

  print("text now of system  ${text}");

  var datetime = DateTime.parse(
      getFicheSeizureByEmailJson!.data!.first.date! +
          "T" +
          getFicheSeizureByEmailJson!.data!.first.time!);
  var month1 = datetime.month.toString().padLeft(2, '0');
  var day1 = datetime.day.toString().padLeft(2, '0');
  var hour1 = datetime.hour.toString().padLeft(2, '0');
  var minute1 = datetime.minute.toString().padLeft(2, '0');
  var second1 = datetime.second.toString().padLeft(2, '0');
  var text1 = '${datetime.year}-$month1-$day1 ${hour1}:${minute1}:${second1}';

  print("text datetime from api   ${text1}");

  Duration diff = DateTime.parse(text).difference(DateTime.parse(text1));

  return diff;
}

/// Get fiche seizure Details from server
getFicheSeizureDetails(int id) {
  _getFicheSeizureDetailsApi.id = id.toString();
  _getFicheSeizureDetailsApi.secureGetData().then((value) {
    getFicheSeizureDetailsJson = value as GetFicheSeizureDetailsJson;
    update();
  });
}

///  Create Undetected alert
createUndetectedAlert() {
  Map<String, dynamic> data = {
    "comment": comment.text,
    //"time": DateFormat('hh:mm a').format(dateTime).toString(),
    "time": DateFormat('hh:mm').format(dateNow).toString(),

    "date": focusedDay.toString(),
    "seizure_id": AccountInfoStorage.readUserId(),
  };

  _undetectedAlertApi.securePost(dataToPost: data).then((value) {
    Get.find<HomeController>().changeSelectedValue(0);
    Get.find<HomeController>().updatePageChange(1);
    Get
        .find<HomeController>()
        .initialPage = 1;
    clearData();
    update();
  });
}

updateUndetectedDetails() async {
  final f = new DateFormat('yyyy-MM-dd');

  Map<String, dynamic> data = {
    "id": idUndetectedAlert,
    "comment": comment.text,
    "time": DateFormat('hh:mm').format(dateNow).toString(),

    //    "time": DateFormat('hh:mm a').format(dateTime).toString(),
    "date": f.format(dateTime),
  };

  _updateUndetectedAlertApi.id = idUndetectedAlert.toString();
  _updateUndetectedAlertApi.securePost(dataToPost: data).then((value) {
    updateUndetectedAlertJson = value as UpdateUndetectedAlertJson;
    isUpdate = false;
    Get.find<HomeController>().changeSelectedValue(0);
    Get.find<HomeController>().updatePageChange(1);
    Get
        .find<HomeController>()
        .initialPage = 1;
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
                      Get.find<HomeController>().updatePageChange(0);
                      Get
                          .find<HomeController>()
                          .initialPage = 0;
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
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
                      Get.find<HomeController>().updatePageChange(2);
                      Get
                          .find<HomeController>()
                          .initialPage = 2;
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .3,
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
}}
// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:knowplesy/data/networking/json/getuserprofilejson.dart';
// import '../../../app/storage/account_info_storage.dart';
// import '../../../data/networking/api/undetected_alert_api.dart';
// import '../../../data/networking/json/add_undetected_alert_json.dart';
// import '../../../data/networking/json/bracelet_json.dart';
// import '../../../data/networking/json/fiche_seizure_json.dart';
// import '../../../data/networking/json/getAlert_bySeizure_json.dart';
// import '../../../data/networking/json/getFicheSeizureByEmail_json.dart';
// import '../../../data/networking/json/getFicheSeizureDetails_json.dart';
// import '../../../data/networking/json/get_alert_byType_json.dart';
// import '../../../data/networking/json/get_details_undetectedAlert_json.dart';
// import '../../../data/networking/json/get_undetected_alert_json.dart';
// import '../../../data/networking/json/update-undetectedAlert_json.dart';
// import '../../../data/networking/json/user_json.dart';
// import '../home_controller.dart';
// import '../setting_controller/personal_information_controller/personnal_information_controller.dart';
//
// class SeizureController extends GetxController {
//   final AddUndetectedAlertApi _undetectedAlertApi = AddUndetectedAlertApi();
//   final GetUndetectedAlertApi _getUndetectedAlertApi = GetUndetectedAlertApi();
//   final UpdateUndetectedAlertApi _updateUndetectedAlertApi =
//       UpdateUndetectedAlertApi();
//   final GetDetailsUndetectedAlert _getDetailsUndetectedAlert =
//       GetDetailsUndetectedAlert();
//   final GetAlertBySeizureApi _getAlertBySeizureApi = GetAlertBySeizureApi();
//   final DeleteUndetectedAlertApi _deleteUndetectedAlertApi =
//       DeleteUndetectedAlertApi();
//   final GetAlertByTypeApi _getAlertByTypeApi = GetAlertByTypeApi();
//   final GetFicheSeizureApi _getFicheSeizureApi = GetFicheSeizureApi();
//   final GetFicheSeizureByEmailApi _getFicheSeizureByEmailApi =
//       GetFicheSeizureByEmailApi();
//   final GetFicheSeizureDetailsApi _getFicheSeizureDetailsApi =
//       GetFicheSeizureDetailsApi();
//   final Map<Guid, List<int>> readValues = <Guid, List<int>>{};
//   UserJson? userJson;
//   GetUserProfilejson? getUserProfilejson;
//   GetAlertByTypeJson? getAlertByTypeJson;
//   GetAlertBySeizureJson? getAlertBySeizureJson;
//   GetUndetectedAlertDetailsJson? getUndetectedAlertDetailsJson;
//   int idUndetectedAlert = 0;
//   TextEditingController comment = TextEditingController();
//   bool getAdsFromServer = false;
//   RxInt time = 5.obs;
//   DateTime dateNow = DateTime.now();
//
//   bool befor = true;
//   int secondsAdd = 30;
//   int befor_diff = 0;
//   String temp_time = "";
//   String heart_time = "";
//   BluetoothDevice? device;
//   DateTime mytime = DateTime.now();
//   DateTime dateTime = DateTime.now();
//   UpdateUndetectedAlertJson? updateUndetectedAlertJson;
//   GetFicheSeizureListJson? ficheSeizureJson;
//   BracletBleutoothJson? bracletBleutoothJson;
//   GetFicheSeizureByEmailJson? getFicheSeizureByEmailJson;
//   String chara = "00002a00-0000-1000-8000-00805f9b34fb";
//   String service_uuid = "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
//
//   // TimeOfDay? day;
//   DateTime? focusedDay = DateTime.now();
//   AddUndetectedAlertJson? addUndetectedAlertJson;
//   GetUndetectedAlertJson? getUndetectedAlertJson;
//   GetFicheSeizureDetailsJson? getFicheSeizureDetailsJson;
//   DateTime? selectedDay;
//   TimeOfDay timeOfDay = TimeOfDay.now();
//   bool isUpdate = false;
//   String? temperature;
//
//   clearData() {
//     comment.text = "";
//   }
//
//   Stream<List<int>>? stream;
//   bool ruun = true;
//
//   BluetoothCharacteristic? characterist;
//
//   getdevice(BluetoothDevice device) {
//     this.device = device;
//   }
//
//   @override
//   void intState() {
//     isReady = false;
//     super.onInit();
//   }
//
//   void dispose() {
//     device!.disconnect();
//     super.dispose();
//   }
//
//   bool? isReady;
//
//   connectTodevice() async {
//     print("nedra connecté");
//     if (device == null) {
//       return;
//     }
//     new Timer(const Duration(seconds: 15), () {
//       if (!isReady!) {
//         disconnectFromdevice();
//       }
//     });
//     await device!.connect();
//     discoverServices();
//   }
//
//   disconnectFromdevice() {
//     print("nedra deconecte");
//
//     if (device == null) {
//       return;
//     }
//     device!.disconnect();
//   }
//
//   ///Get Data From Bluetooth
//   dataBluetooth({required service, dev}) async {
//     this.device = dev;
//
//     for (BluetoothService service in service) {
//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         String data = '{"request":"data","action":"GET"}';
//
//         print("characteristic=========>$characteristic");
//         if (characteristic.properties.read) {
//           print("chara_ui========> ${characteristic.uuid}");
//           print("service_ui========> ${service.uuid}");
//
//           var sub = characteristic.value.listen((value) {
//             readValues[characteristic.uuid] = value;
//           });
//           await characteristic.read();
//           sub.cancel();
//         }
//
//         if (characteristic.properties.write) {
//           print("service_ui========> ${service.uuid}");
//
//           while (ruun) {
//             await Future.delayed(Duration(seconds: (3)));
//             await characteristic.write(utf8.encode(data));
//           }
//         }
//       }
//     }
//   }
//
//   discoverServices() async {
//     List<BluetoothService>? services = await device!.discoverServices();
//     services?.forEach((service) {
//       if (service.uuid.toString() == service.uuid) {
//         print("service_ui========> ${service.uuid}");
//
//         service.characteristics.forEach((characteristics) {
//           if (characterist!.uuid.toString() == chara) ;
//           characterist!.setNotifyValue(!characterist!.isNotifying);
//           //  final decoded = utf8.decode(value);
//           // DataParser(decoded);
//           stream = characterist!.value;
//           log("stream $stream");
//           isReady = true;
//           print("the divceois    =>${device?.name}");
//         });
//       }
//     });
//   }
//
//   //  print(" characterist?.value    ${characterist}");
//
//   //  characteristic.value.listen((value) async {
//   ///
//
//   // readValues[characteristic.uuid] = value;
//
//   // stream.sink.add(value);
//   //  });
//   // await characteristic.setNotifyValue(true);
//
//   String convertData(List<int> dataFromDevice) {
//     return utf8.decode(dataFromDevice);
//   }
//
//   upDateTime() async {
//     while (true) {
//       await Future.delayed(Duration(seconds: 1));
//       time.value--;
//
//       if (time.value == 0) {
//         getFicheSeizureByEmail(AccountInfoStorage.readEmail()!);
//
//         time.value = 10;
//       }
//       if (time.value == 5) {
//         befor = false;
//       }
//     }
//   }
//
//   ///DataParser Heart and Temperature
//   DataParser(String data) {
//     if (data.isNotEmpty) {
//       RegExp heart = RegExp(r'PPG\":\[\"[0-9]+\.[0-9]+');
//       RegExpMatch? rege = heart.firstMatch(data);
//       var heartValue = rege
//               ?.group(0)
//               ?.split(":")
//               ?.last
//               ?.replaceAll("[", "")
//               ?.replaceAll("]", "")
//               .replaceAll("\"", "") ??
//           "";
//       ;
//       RegExp temp = RegExp(r'TEMP\":\[\"[0-9]+\.[0-9]+');
//       RegExpMatch? regetEMP = temp.firstMatch(data);
//       var tempValue = regetEMP
//               ?.group(0)
//               ?.split(":")
//               ?.last
//               ?.replaceAll("[", "")
//               ?.replaceAll("]", "")
//               .replaceAll("\"", "") ??
//           "";
//       ;
//
//       if (tempValue != "") {
//         this.temp_time = tempValue;
//       }
//       if (tempValue != "") {
//         this.heart_time = heartValue;
//       }
//       getValueOfTempWithBlue();
//       getValueOfHeartWithBlue();
//
//       temperature = tempValue + "'C'";
//     }
//   }
//
//   ///Get Value of Temperature from Bluetooth
//   getValueOfTempWithBlue() {
//     print("temp_time =====> ${temp_time}");
//
//     return this.temp_time;
//   }
//
//   ///Get Value of heart from Bluetooth
//   getValueOfHeartWithBlue() {
//     return this.heart_time;
//   }
//
//   /// update Time of server with appareil when you connect with wifi
//   /// get Number Alert
//   getNbrAlert() async {
//     await Get.find<PersonnelInformationController>().getUserData();
//     getUserProfilejson =
//         Get.find<PersonnelInformationController>().getUserProfilejson;
//     update();
//   }
//
//   ///show time picker method
//   showMyTimePicker(context) {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     ).then((value) async {
//       timeOfDay = value!;
//       DateTime ff = DateTime.now();
//       // TimeOfDay vv = TimeOfDay(hour: 10, minute: 50);
//       dateNow =
//           DateTime(ff.year, ff.month, ff.day, timeOfDay.hour, timeOfDay.minute);
//
//       update();
//     });
//   }
//
//   /// Get all Undetected alert from server in screen home
//   getUndetectedAlert() {
//     _getUndetectedAlertApi.id = id;
//     _getUndetectedAlertApi.secureGetData().then((value) {
//       getUndetectedAlertJson = value as GetUndetectedAlertJson;
//       update();
//     });
//   }
//
//   String id = "";
//
//   @override
//   void onInit() {
//     super.onInit();
//     id = AccountInfoStorage.readUserId() ?? "";
//   }
//
//   getAlertBySeizure() {
//     _getAlertBySeizureApi.id = AccountInfoStorage.readUserId() ?? "";
//     _getAlertBySeizureApi.secureGetData().then((value) {
//       getAlertBySeizureJson = value as GetAlertBySeizureJson;
//       update();
//     });
//   }
//
//   /// Get fiche seizure from apareil
//   getFicheSeizure() {
//     _getFicheSeizureApi.secureGetData().then((value) {
//       ficheSeizureJson = value as GetFicheSeizureListJson;
//       update();
//     });
//   }
//
//   /// Get fiche seizure from details by email
//   getFicheSeizureByEmail(String email) {
//     _getFicheSeizureByEmailApi.email = email;
//     _getFicheSeizureByEmailApi.secureGetData().then((value) {
//       getFicheSeizureByEmailJson = value as GetFicheSeizureByEmailJson;
//       if (befor_diff < 30) {
//         befor = true;
//         update();
//       } else {
//         befor = false;
//         update();
//       }
//     });
//   }
//
//   ///Fuction to get same time of server and apareil
//   getTimeInSameTime() {
//     var now = DateTime.now();
//     var month = now.month.toString().padLeft(2, '0');
//     var day = now.day.toString().padLeft(2, '0');
//     var hour = now.hour.toString().padLeft(2, '0');
//     var minute = now.minute.toString().padLeft(2, '0');
//     var second = now.second.toString().padLeft(2, '0');
//     var text = '${now.year}-$month-$day ${hour}:${minute}:${second}';
//
//     print("text now of system  ${text}");
//
//     var datetime = DateTime.parse(
//         getFicheSeizureByEmailJson!.data!.first.date! +
//             "T" +
//             getFicheSeizureByEmailJson!.data!.first.time!);
//     var month1 = datetime.month.toString().padLeft(2, '0');
//     var day1 = datetime.day.toString().padLeft(2, '0');
//     var hour1 = datetime.hour.toString().padLeft(2, '0');
//     var minute1 = datetime.minute.toString().padLeft(2, '0');
//     var second1 = datetime.second.toString().padLeft(2, '0');
//     var text1 = '${datetime.year}-$month1-$day1 ${hour1}:${minute1}:${second1}';
//
//     print("text datetime from api   ${text1}");
//
//     Duration diff = DateTime.parse(text).difference(DateTime.parse(text1));
//
//     return diff;
//   }
//
//   /// Get fiche seizure Details from server
//   getFicheSeizureDetails(int id) {
//     _getFicheSeizureDetailsApi.id = id.toString();
//     _getFicheSeizureDetailsApi.secureGetData().then((value) {
//       getFicheSeizureDetailsJson = value as GetFicheSeizureDetailsJson;
//       update();
//     });
//   }
//
//   ///  Create Undetected alert
//   createUndetectedAlert() {
//     Map<String, dynamic> data = {
//       "comment": comment.text,
//       //"time": DateFormat('hh:mm a').format(dateTime).toString(),
//       "time": DateFormat('hh:mm').format(dateNow).toString(),
//
//       "date": focusedDay.toString(),
//       "seizure_id": AccountInfoStorage.readUserId(),
//     };
//
//     _undetectedAlertApi.securePost(dataToPost: data).then((value) {
//       Get.find<HomeController>().changeSelectedValue(0);
//       Get.find<HomeController>().updatePageChange(1);
//       Get.find<HomeController>().initialPage = 1;
//       clearData();
//       update();
//     });
//   }
//
//   updateUndetectedDetails() async {
//     final f = new DateFormat('yyyy-MM-dd');
//
//     Map<String, dynamic> data = {
//       "id": idUndetectedAlert,
//       "comment": comment.text,
//       "time": DateFormat('hh:mm').format(dateNow).toString(),
//
//       //    "time": DateFormat('hh:mm a').format(dateTime).toString(),
//       "date": f.format(dateTime),
//     };
//
//     _updateUndetectedAlertApi.id = idUndetectedAlert.toString();
//     _updateUndetectedAlertApi.securePost(dataToPost: data).then((value) {
//       updateUndetectedAlertJson = value as UpdateUndetectedAlertJson;
//       isUpdate = false;
//       Get.find<HomeController>().changeSelectedValue(0);
//       Get.find<HomeController>().updatePageChange(1);
//       Get.find<HomeController>().initialPage = 1;
//       clearData();
//     });
//   }
//
//   /// Get Undetected alert details
//
//   getUndetectedAlertDetail(int id, context) async {
//     _getDetailsUndetectedAlert.id = id.toString();
//     await _getDetailsUndetectedAlert.secureGetData().then((value) async {
//       getUndetectedAlertDetailsJson = value as GetUndetectedAlertDetailsJson;
//       comment.text = getUndetectedAlertDetailsJson!.data!.comment!;
//       // timeOfDay= getUndetectedAlertDetailsJson!.data!.time!;
//       // dateTime= getUndetectedAlertDetailsJson!.data!.date!;
//       Get.find<HomeController>().changeSelectedValue(1);
//       // Get.find<HomeController>().initialPage = 1;
//       //Navigator.of(context).push(MaterialPageRoute(
//       //  builder: (
//       // context,
//       // ) =>
//       //           SeizurePage()));
//     });
//   }
//
//   showMyDialog(context) async {
//     return showDialog<void>(
//       context: context,
//       //    barrierDismissible: false,
//       // user must tap button!
//       builder: (BuildContext context) {
//         Future.delayed(
//           Duration(seconds: 8),
//           () {
//             Navigator.of(context).pop(true);
//           },
//         );
//         return AlertDialog(
//           title: Image.asset(
//             "assets/images/alert.png",
//             width: 200,
//             height: 150,
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Center(
//                     child: Text(
//                   "Seizure Alert",
//                   style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
//                 )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Text(
//                     "If you Don't cancel the alert, the Following\n             Caregivers will be notified.",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Text(
//                     "08 secondes",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         CircleAvatar(
//                             backgroundImage:
//                                 AssetImage("assets/images/avatar.png"),
//                             maxRadius: 30),
//                         Text("Doctor"),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                             backgroundImage:
//                                 AssetImage("assets/images/avatar.png"),
//                             maxRadius: 30),
//                         Text("Dad")
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.find<HomeController>().updatePageChange(0);
//                         Get.find<HomeController>().initialPage = 0;
//                       },
//                       child: Container(
//                         height: 70,
//                         width: MediaQuery.of(context).size.width * .3,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 7,
//                               offset:
//                                   Offset(0, 3), // changes position of shadow
//                             )
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Center(
//                               child: Image.asset("assets/images/chek.png"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         Get.find<HomeController>().updatePageChange(2);
//                         Get.find<HomeController>().initialPage = 2;
//                       },
//                       child: Container(
//                         height: 70,
//                         width: MediaQuery.of(context).size.width * .3,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 7,
//                               offset:
//                                   Offset(0, 3), // changes position of shadow
//                             )
//                           ],
//                         ),
//                         child: Center(
//                           child: Image.asset("assets/images/false_alert.png"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           actions: <Widget>[],
//         );
//       },
//     );
//   }
//
//   /// delete Undetected alert from server
//   deleteUndetectedAlert({required DataAlert undetectedAlert}) {
//     Map<String, dynamic> data = {"id": undetectedAlert.id};
//     _deleteUndetectedAlertApi.secureDelete(data: data).then((value) {
//       update();
//     });
//   }
// }
