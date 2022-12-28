import 'package:knowplesy/data/networking/api/api_mager.dart';
import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';
import 'package:knowplesy/data/networking/json/add_undetected_alert_json.dart';

import '../../../app/config/app_settings.dart';
import '../json/fiche_seizure_json.dart';
import '../json/getAlert_bySeizure_json.dart';
import '../json/get_alert_byType_json.dart';
import '../json/get_details_undetectedAlert_json.dart';
import '../json/get_undetected_alert_json.dart';
import '../json/update-undetectedAlert_json.dart';

class AddUndetectedAlertApi extends ApiManager {
  @override
  String apiUrl() {
    return SettingsApp.addUndetectedAlert;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AddUndetectedAlertJson.fromJson(data);
  }
}

class UpdateUndetectedAlertApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.UpdateUndetectedAlert + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return UpdateUndetectedAlertJson.fromJson(data);
  }
}

class GetUndetectedAlertApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.getUndetectedAlert + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetUndetectedAlertJson.fromJson(data);
  }
}

class GetAlertByTypeApi extends ApiManager {
  String type = "";

  @override
  String apiUrl() {
    return SettingsApp.getAlertByType + type;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetAlertByTypeJson.fromJson(data);
  }
}

class GetFicheSeizureApi extends ApiManager {
  @override
  String apiUrl() {
    return SettingsApp.getFichSeizure;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return FicheSeizureJson.fromJson(data);
  }
}

class GetAlertBySeizureApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.getAlertBySeizure + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetAlertBySeizureJson.fromJson(data);
  }
}

class DeleteUndetectedAlertApi extends ApiManager {
  // String id = "";

  @override
  String apiUrl({dataToPost}) {
    return SettingsApp.deleteUndetectedAlert;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}

class GetDetailsUndetectedAlert extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.getDetailsUndetectedAlert + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetUndetectedAlertDetailsJson.fromJson(data);
  }
}
