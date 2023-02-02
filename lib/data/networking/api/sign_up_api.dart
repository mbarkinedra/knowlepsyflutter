import '../../../app/config/app_settings.dart';
import '../json/abstract__json_resource.dart';
import '../json/user_json.dart';
import 'api_mager.dart';

class SignUpApi extends ApiManager {
  @override
  AbstractJsonResource fromJson(data) {
    return UserJson.fromJson(data);
  }

  @override
  String apiUrl() {
    return SettingsApp.registerUrl;
  }
}
