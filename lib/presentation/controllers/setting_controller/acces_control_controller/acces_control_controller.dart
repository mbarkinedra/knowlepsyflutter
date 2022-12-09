import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../app/storage/account_info_storage.dart';
import '../../../../data/networking/api/careGiver_api.dart';
import '../../../../data/networking/api/sign_up_api.dart';
import '../../../../data/networking/json/careGiver_json.dart';
import '../../../../data/networking/json/get_all_caregiver_json.dart';
import '../../../pages/home/setting_page/access_control_page/access_control_page.dart';

class AccesControlController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final AddCareGiverApi _addCareGiveApi = AddCareGiverApi();
  final GetAllCareGiverApi _getAllCareGiverApi = GetAllCareGiverApi();
  final AddStatusCareGiverApi _addStatusCareGiverApi = AddStatusCareGiverApi();
  final DeleteCareGiverApi _deleteCareGiverApi = DeleteCareGiverApi();
  final GetStatusCareGiverApi _getStatusCareGiverApi = GetStatusCareGiverApi();

  TextEditingController caregiverName = TextEditingController();
  TextEditingController doctorName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();

  CareGiverJson _careGiverJson = CareGiverJson();
  GetAllCaregiverJson? getAllCaregiverJson;

  @override
  void onInit() {
    super.onInit();
  }

  /// Add caregiver by seizer
  addCaregiver(context) async {
    Map<String, dynamic> data = {
      "email": email.text,
      "first_name": caregiverName.text,
      "phone_number": phoneNumber.text,
    };
    _addCareGiveApi.securePost(dataToPost: data).then((value) {
      _careGiverJson = value as CareGiverJson;

      getAllCaregiver();

      update();
    });
    update();
  }

  /// get all caregiver by id seizer
  getAllCaregiver() async {
    _getAllCareGiverApi.id = AccountInfoStorage.readUserId() ?? "";
    _getAllCareGiverApi.secureGetData().then((value) {
      getAllCaregiverJson = value as GetAllCaregiverJson;
      print(getAllCaregiverJson?.toJson());
      update();
    });
  }

  /// enable or desable caregiver
  switchActiveOrNotActive({
    required DataE dataE,
    required bool activeOrNotActive,
  }) {
    if (activeOrNotActive) {
      addStateCaregiver(caregiverseizure: dataE);
      //   getAllCaregiver();
    }
    // else {
    // getStatusCaregiver();
    //   // getAllCaregiver();
    // }
  }

  addStateCaregiver({required DataE caregiverseizure}) {
    Map<String, dynamic> d = {
      "caregiver_id": caregiverseizure.caregiverseizure!.id,
      "activeCaregiver": caregiverseizure.activeCaregiver
    };
    // _addStatusCareGiverApi.data =
    //     "?caregiver_id=${caregiverseizure.caregiverseizure!.id}&activeCaregiver=${caregiverseizure.activeCaregiver}";
    _addStatusCareGiverApi.securePost(dataToPost: d).then((value) {});
  }

  getStatusCaregiver({required bool state}) {
    Map<String, dynamic> d = {"state": state ? 1 : 0};
    _getStatusCareGiverApi.secureGetData(data: d).then((value) {});
  }

  ///Delete caregiver by seizer from server
  deleteCaregiver({required DataE caregiverseizure}) {
    Map<String, dynamic> d = {
      "caregiver_id": caregiverseizure.caregiverseizure!.id
    };
    _deleteCareGiverApi.secureDelete(data: d).then((value) {
      print(value);
    });
  }
}
