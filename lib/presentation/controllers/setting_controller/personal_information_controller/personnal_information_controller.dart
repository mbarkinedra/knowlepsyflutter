import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/storage/account_info_storage.dart';
import '../../../../app/util/app_colors.dart';
import '../../../../data/networking/api/user_profile_api.dart';
import '../../../../data/networking/json/getuserprofilejson.dart';
import '../../../../data/networking/json/user_json.dart';
import 'package:dio/dio.dart' as di;

class PersonnalInformationController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController country = TextEditingController();
  List<File> images = [];
  GetUserProfilejson? getUserProfilejson;
  bool updateData = false;
  final GetUserProfileApi _getUserProfileApi = GetUserProfileApi();
  final EditUserProfileApi _editUserProfileApi = EditUserProfileApi();
  User user = User();
  final ImagePicker _picker = ImagePicker();
  File? img;

  /// Image Picker
  Future pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    img = File(image.path);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  ///Update User from server
  updateUserData() async {
    print("object");
    updateData = true;
    String fileName = "";
    if (img != null) {
      fileName = img!.path.split('/').last;
    }
    di.FormData formData = di.FormData.fromMap({});
    if (img != null) {
      formData = di.FormData.fromMap({
        "first_name": firstName.text,
        "phone_number": phoneNumber.text,
        "last_name": lastName.text,
        "image_url": await di.MultipartFile.fromFile(img?.path ?? "",
            filename: fileName, contentType: new MediaType('image', 'png'))
      });
    } else {
      formData = di.FormData.fromMap({
        "first_name": firstName.text,
        "phone_number": phoneNumber.text,
        "last_name": lastName.text,
      });
    }
    _editUserProfileApi.securePost(dataToPost: formData).then(
      (value) {

        GetUserProfilejson getUserProfilejson=value as GetUserProfilejson;
        print(" Get.snackbar(");
        Get.snackbar(
          "",
          getUserProfilejson.message ?? "",
          backgroundColor: AppColors.secondryColor,
          colorText: Colors.white,
        );
      },
    ).catchError((e) {
      print(e.toString());
      updateData = false;
      update();
    });
  }

  /// Get User information from server
  getUserData() {
    firstName.text = AccountInfoStorage.readFirstName() ?? "";
    lastName.text = AccountInfoStorage.readLastName() ?? "";
    //"image_url":"avatar.png"
    email.text = AccountInfoStorage.readEmail() ?? "";
    phoneNumber.text = AccountInfoStorage.readPhone() ?? "";
    _getUserProfileApi.secureGetData().then((value) {
      getUserProfilejson = value as GetUserProfilejson;
      print(getUserProfilejson?.data?.toJson());
      firstName.text = getUserProfilejson?.data?.firstName ?? "";
      lastName.text = getUserProfilejson?.data?.lastName ?? "";
      phoneNumber.text = getUserProfilejson?.data?.phoneNumber ?? "";
      email.text = getUserProfilejson?.data?.email ?? "";
      AccountInfoStorage.saveUserId(getUserProfilejson!.data!.id.toString());
      update();
    });
  }
}
