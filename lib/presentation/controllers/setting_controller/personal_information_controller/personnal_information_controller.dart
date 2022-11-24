import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/storage/account_info_storage.dart';
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

  //final localisation = Get.find<LocController>();
  bool updateData = false;

  // ServerValidator validateServer = ServerValidator();
  AccountInfoStorage _storage = AccountInfoStorage();
  GetUserProfileApi _getUserProfileApi = GetUserProfileApi();
  EditUserProfileApi _editUserProfileApi = EditUserProfileApi();
  User user = User();
  final ImagePicker _picker = ImagePicker();
  File? img;

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

  updateUserData() async {
    updateData = true;
    String fileName = "";
    if (img != null) {
      fileName = img!.path.split('/').last;
    }

    Map<String, dynamic> data = {
      "first_name": firstName,
      "image_url":
          await di.MultipartFile.fromFile(img!.path, filename: fileName),
      "last_name": lastName,
      "phone_number": phoneNumber,
    };
    _editUserProfileApi.securePost(dataToPost: data).then(
      (value) {
      //  Get.find<AccountInfoStorage>().saveFirstName(user.firstName ?? "");
      //  Get.find<AccountInfoStorage>().saveLastName(user.lastName ?? "");
      },
    ).catchError((e) {
      updateData = false;
      update();
    });
  }

  GetUserProfilejson? getUserProfilejson;

  getUserData() {
    print(
        "iam startttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
    // _editUserProfileApi. = Get.find<AccountInfoStorage>().readUserId();
    firstName.text = _storage.readFirstName() ?? "";
    lastName.text = _storage.readLastName() ?? "";

    //"image_url":"avatar.png"
    email.text = _storage.readEmail() ?? "";
    phoneNumber.text = _storage.readPhone() ?? "";

    _getUserProfileApi.secureGetData().then((value) {
      getUserProfilejson = value as GetUserProfilejson;

      print(getUserProfilejson?.data?.toJson());
      firstName.text = getUserProfilejson?.data?.firstName ?? "";
      lastName.text = getUserProfilejson?.data?.lastName ?? "";
      phoneNumber.text = getUserProfilejson?.data?.phoneNumber ?? "";
      email.text = getUserProfilejson?.data?.email ?? "";
      Get.find<AccountInfoStorage>()
          .saveUserId(getUserProfilejson!.data!.id.toString());
      update();
      //Get.find<TapHomeViewController>().setUserName(user.username);

      // localisation.cities.forEach((element) {
      //   if (element.id == user.city.id) {
      //     localisation.updateCity(element);
      //     update();
      //   }
      // });
      //_userApi.id = null;
    });
  }
//
// /// Open Camera from Emelator
// void openCamera() async {
//   var imgCamera = await _picker.pickImage(source: ImageSource.camera);
//   if (imgCamera != null) {
//     images.add(File(imgCamera.path));
//     update();
//   }
//   update();
// }
//
// /// Open Camera from Emelator
//
// void openGallery() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     img.add(File(pickedFile.path));
//     update();
//   }
//   update();
// }
}
