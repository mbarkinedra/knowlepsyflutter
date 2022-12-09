import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../app/config/app_settings.dart';
import '../json/abstract__json_resource.dart';
import '../json/careGiver_json.dart';
import '../json/get_all_caregiver_json.dart';
import 'api_mager.dart';

class AddCareGiverApi extends ApiManager {
  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.addCaregiver;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return fromJson(data);
  }
}

class GetAllCareGiverApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.getAllCareGiver + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetAllCaregiverJson.fromJson(data);
  }
}

class AddStatusCareGiverApi extends ApiManager {
  String data = "";

  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.addStateStateCareGiver + data;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetAllCaregiverJson.fromJson(data);
  }
}

class GetStatusCareGiverApi extends ApiManager {

  @override
  String apiUrl() {
    return SettingsApp.getAllStateCareGiver ;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetAllCaregiverJson.fromJson(data);
  }
}

class DeleteCareGiverApi extends ApiManager {
  String id = "";

  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.deleteUndetectedAlert + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
