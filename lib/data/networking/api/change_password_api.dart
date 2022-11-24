
import 'package:knowplesy/data/networking/json/user_json.dart';

import '../../../app/config/app_settings.dart';
import 'api_mager.dart';

abstract class AbstractPasswordApi extends ApiManager {
  @override
  fromJson(data) {
    return UserJson.fromJson(data);
  }
}

class ChangePasswordApi extends AbstractPasswordApi {
  @override
  String apiUrl() {
    return SettingsApp.changePasswordUrl;
  }
}