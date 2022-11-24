import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../app/config/app_settings.dart';
import '../json/abstract__json_resource.dart';
import '../json/careGiver_json.dart';
import 'api_mager.dart';

abstract class CareGiver extends ApiManager {
  @override
  AbstractJsonResource fromJson(data) {
    return CareGiverJson.fromJson(data);
  }
}

class AddCareGiver extends CareGiver {
  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.addCaregiver;
  }
}

class GetAllCareGiver extends CareGiver {
  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.addCaregiver;
  }
}

class DeleteCareGiver extends CareGiver {
  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.addCaregiver;
  }
}
