import 'package:knowplesy/data/networking/api/api_mager.dart';
import 'package:knowplesy/data/networking/json/abstract__json_resource.dart';

import '../../../app/config/app_settings.dart';
import '../json/forgot_password_json.dart';
import '../json/reset_password_withCode_json.dart';
import '../json/verify_code_json.dart';

class ForgotPasswordWithCodeApi extends ApiManager {
  @override
  String apiUrl() {
    // TODO: implement apiUrl
    return SettingsApp.forgotPasswordWithCode;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    return ForgotPasswordJson.fromJson(data);
  }
}
class VerifyCodePassword extends ApiManager {
  @override
  String apiUrl() {
    // TODO: implement apiUrl
    return SettingsApp.verifyCodeForgotPassword;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    return VerifCodePasswordJson.fromJson(data);
  }
}
class ResetPasswordWithCodeApi extends ApiManager {
  @override
  String apiUrl() {
    // TODO: implement apiUrl
    return SettingsApp.resetPasswordWithCode;
  }

  @override
  AbstractJsonResource fromJson(data) {
    // TODO: implement fromJson
    return ResetPasswordWithCodeJson.fromJson(data);
  }
}
