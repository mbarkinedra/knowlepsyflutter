import 'package:knowplesy/app/config/app_settings.dart';
import 'package:knowplesy/data/networking/api/api_mager.dart';
import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

import '../json/get_reminderMe_json.dart';
import '../json/reminder_json.dart';

class AddReminderMeApi extends ApiManager {
  @override
  String apiUrl() {
    // TODO: implement apiUrl
    return SettingsApp.addReminderMe;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    return AddReminderJson.fromJson(data);
  }
}
class GetReminderMeApi extends ApiManager {
  @override
  String apiUrl() {
    // TODO: implement apiUrl
    return SettingsApp.getReminderMe;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    return GetReminderJson.fromJson(data);
  }
}
