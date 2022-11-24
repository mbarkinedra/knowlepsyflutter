import 'package:knowplesy/data/networking/api/api_mager.dart';
import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

import '../../../app/config/app_settings.dart';
import '../json/logOut_json.dart';

class LogoutApi extends ApiManager {
  @override
  String apiUrl() {
    return SettingsApp.logoutUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return LogOutJson.fromJson(data);
  }
}
