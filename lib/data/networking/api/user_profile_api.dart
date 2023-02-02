import '../../../app/config/app_settings.dart';
import '../json/getuserprofilejson.dart';
import 'api_mager.dart';

abstract class AbstractUserProfileApi extends ApiManager {
  @override
  fromJson(data) {
    return GetUserProfilejson.fromJson(data);
  }
}

class GetUserProfileApi extends AbstractUserProfileApi {
  @override
  String apiUrl() {
    return SettingsApp.getUserProfile;
  }
}

class EditUserProfileApi extends AbstractUserProfileApi {
  @override
  String apiUrl() {
    return SettingsApp.editUserProfile;
  }
}
