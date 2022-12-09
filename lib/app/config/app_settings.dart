class SettingsApp {
  static String get baseUrl => 'http://192.168.1.14:8000';

  static String get apiPrefix => '/api';

  static String get baseApiUrl => baseUrl + apiPrefix;

  static String get loginUrl => '$baseApiUrl/auth/login';

  static String get registerUrl => '$baseApiUrl/auth/signUpClient';

  static String get logoutUrl => '$baseApiUrl/auth/logout';

  static String get changePasswordUrl => '$baseApiUrl/password/changerPassword';

  static String get resetPasswordUrl => '$baseApiUrl/auth/refresh';

  static String get getUserProfile => '$baseApiUrl/user/userProfile';

  static String get editUserProfile => '$baseApiUrl/user/editProfile';

  static String get addCaregiver => '$baseApiUrl/auth/addCaregiver';

  static String get getAllCareGiver =>
      '$baseApiUrl/CaregiverSeizure/CaregiverSeizurebyidSeizure?seizure_id=';

  static String get getAllStateCareGiver =>
      '$baseApiUrl/CaregiverSeizure/CaregiverSeizurebystateCaregiver';

  static String get addStateStateCareGiver =>
      '$baseApiUrl/CaregiverSeizure/enabledesableCaregiver';

  static String get deleteCareGiver =>
      '$baseApiUrl/CaregiverSeizure/deleteCaregiverSeizure?caregiver_id=';

  static String get addUndetectedAlert =>
      '$baseApiUrl/undetectedAlert/addUndetectedAlert';

  static String get getUndetectedAlert =>
      '$baseApiUrl/undetectedAlert/UndetectedAlertList?seizure_id=';

  static String get deleteUndetectedAlert =>
      '$baseApiUrl/undetectedAlert/deleteUndetectedAlert';

  static String get getAlertByType => '$baseApiUrl/alert/alertByType?type=';

  static String get addMedications => '$baseApiUrl/medication/addMedications';

  static String get getMedecation => '$baseApiUrl/medication/medications';

  static String get verifyCodeForgotPassword =>
      '$baseApiUrl/password/verifCodeForgetPassword';

  static String get forgotPasswordWithCode =>
      '$baseApiUrl/password/forgotpasswordwithCode';

  static String get resetPasswordWithCode =>
      '$baseApiUrl/password/resetPasswordWithCode';
}
