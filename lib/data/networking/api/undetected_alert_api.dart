import 'package:knowplesy/data/networking/api/api_mager.dart';
import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';
import 'package:knowplesy/data/networking/json/add_undetected_alert_json.dart';

import '../../../app/config/app_settings.dart';
import '../json/get_undetected_alert_json.dart';

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
    return GetUndetectedAlertJson.fromJson(data);
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
