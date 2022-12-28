import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import '../../../../app/storage/account_info_storage.dart';
import '../../../../data/networking/api/careGiver_api.dart';
import '../../../../data/networking/api/sign_up_api.dart';
import '../../../../data/networking/json/addDoctor_json.dart';
import '../../../../data/networking/json/careGiver_json.dart';
import '../../../../data/networking/json/getDoctor_json.dart';
import '../../../../data/networking/json/get_all_caregiver_json.dart';
import '../../../../domain/validator/validator_signUp.dart';
import '../../../pages/home/setting_page/access_control_page/access_control_page.dart';

class AccessControlController extends GetxController {
  final AddCareGiverApi _addCareGiveApi = AddCareGiverApi();
  final AddDoctorApi _addDoctorApi = AddDoctorApi();
  final AddStatusDoctor _addStatusDoctor = AddStatusDoctor();
  final GetAllCareGiverApi _getAllCareGiverApi = GetAllCareGiverApi();
  final AddStatusCareGiverApi _addStatusCareGiverApi = AddStatusCareGiverApi();
  final DeleteCareGiverApi _deleteCareGiverApi = DeleteCareGiverApi();
  final GetStatusCareGiverApi _getStatusCareGiverApi = GetStatusCareGiverApi();
  final GetStatusDoctorApi _getStatusDoctorApi = GetStatusDoctorApi();
  ValidatorSignUp validator = ValidatorSignUp();

  final GetDoctorApi _getDoctorApi = GetDoctorApi();
  TextEditingController caregiverName = TextEditingController();
  TextEditingController caregiverLastName = TextEditingController();

  final doctorKey = GlobalKey<FormState>();
  final caregiverKey = GlobalKey<FormState>();

  TextEditingController doctorName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  List<GetAllCaregiverJson> caregivers = [];
  CareGiverJson? careGiverJson;
  AddDoctorJson addDoctorJson = AddDoctorJson();
  GetAllCaregiverJson? getAllCaregiverJson;
  GetDoctorJson? getDoctorJson;

  @override
  void onInit() {
    super.onInit();
  }

  ///clear All Data Caregiver
  clearAllData() {
    caregiverName.text = "";
    email.text = "";
    phoneNumber.text = "";

    update();
  }

  ///clear All Data Doctor
  clearAllDataDoctor() {
    doctorName.text = "";
    email.text = "";
    phoneNumber.text = "";

    update();
  }

  /// Add caregiver by seizure
  addCaregiver() async {
    Map<String, dynamic> data = {
      "email": email.text,
      "first_name": caregiverName.text,
      "last_name": caregiverLastName.text,
      "phone_number": phoneNumber.text,
    };
    _addCareGiveApi.securePost(dataToPost: data).then((value) {
      careGiverJson = value as CareGiverJson;
      getAllCaregiver();
      update();
    });
  }
  /// Add caregiver by seizure
  addDoctor() async {
    Map<String, dynamic> data = {
      "email": email.text,
      "first_name": doctorName.text,
      "phone_number": phoneNumber.text,
    };
    _addDoctorApi.securePost(dataToPost: data).then((value) {
      addDoctorJson = value as AddDoctorJson;
      getDoctor();
      update();
    });
  }
  /// get all caregiver by id seizer
  getAllCaregiver() async {
    _getAllCareGiverApi.id = AccountInfoStorage.readUserId() ?? "";

    _getAllCareGiverApi.secureGetData().then((value) {
      getAllCaregiverJson = value as GetAllCaregiverJson;
      update();
    });
  }

  /// get doctor  by id seizer
  getDoctor() async {
    _getDoctorApi.id = AccountInfoStorage.readUserId() ?? "";
    _getDoctorApi.secureGetData().then((value) {
      print((value));
     getDoctorJson = value as GetDoctorJson;
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

  switchActiveOrNotActiveDoctor({
    required DataD dataDoctor,
    required bool activeOrNotActive,
  }) {
    if (activeOrNotActive) {
      addStateDoctor(doctorconsultation: dataDoctor);
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

  addStateDoctor({required DataD doctorconsultation}) {
    Map<String, dynamic> d = {
      "doctor_id": doctorconsultation.doctorconsultation!.id,
      "state_doctor ": doctorconsultation.stateDoctor
    };
    // _addStatusCareGiverApi.data =
    //     "?caregiver_id=${caregiverseizure.caregiverseizure!.id}&activeCaregiver=${caregiverseizure.activeCaregiver}";
    _addStatusDoctor.securePost(dataToPost: d).then((value) {});
  }

  getStatusCaregiver({required bool state}) {
    Map<String, dynamic> d = {"state": state ? 1 : 0};
    _getStatusCareGiverApi.secureGetData(data: d).then((value) {});
  }

  getStatusDoctor({required bool state_doctor}) {
    Map<String, dynamic> d = {"state_doctor ": state_doctor ? 1 : 0};
    getStatusDoctor(state_doctor: state_doctor)
        .secureGetData(data: d)
        .then((value) {});
  }

  ///Delete caregiver by seizure from server
  deleteCaregiver({index, required DataE caregiverseizure}) {
    Map<String, dynamic> d = {
      "caregiver_id": caregiverseizure.caregiverseizure!.id
    };
    _deleteCareGiverApi.secureDelete(data: d).then((value) {
      print(value);
    });
    Get.snackbar("Succes", "Caregiver deleted successfully",
        backgroundColor: AppColors.secondryColor, colorText: Colors.white);
  }


}
