import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/storage/secure_storage.dart';
import '../../pages/home/setting_page/language_page/language_page.dart';

class LanguageController extends GetxController {
  SingingCharacter? lan = SingingCharacter.English;

  updateToEnglish() {
    var locale = Locale('en', 'En');
    Get.updateLocale(locale);
    SecureStorage.writeSecureData(key: 'lan', value: "en");
    lan = SingingCharacter.English;
    update();
  }

  updateToFrensh() {
    var locale = Locale('fr', 'Fr');
    Get.updateLocale(locale);
    SecureStorage.writeSecureData(key: 'lan', value: "fr");
    lan = SingingCharacter.French;
    update();
  }
}
