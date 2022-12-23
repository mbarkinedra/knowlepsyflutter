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

  static String get addDoctor => '$baseApiUrl/consultation/seizureAddDoctor';

  static String get getAllCareGiver =>
      '$baseApiUrl/CaregiverSeizure/CaregiverSeizurebyidSeizure?seizure_id=';

  static String get addStateDoctor =>
      '$baseApiUrl/consultation/enabledesableDoctor';

  static String get getAllStateDoctor =>
      '$baseApiUrl/consultation/seizuredoctotStat';

  static String get getDoctor =>
      '$baseApiUrl/consultation/ConsultationSeizure?seizure_id=';

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

  static String get addStateMedications =>
      '$baseApiUrl/medication/stateMedication?medication_id=';
  static String get updateMedications =>
      '$baseApiUrl/medication/updateMedication?id=';
  static String get getMedecation =>
      '$baseApiUrl/medication/medications?seizure_id=';
  static String get getModifMedecation =>
      '$baseApiUrl/medication/medication/{id}?id=';

  static String get addReminderMe => '$baseApiUrl/medication/reminderMe';

  static String get getReminderMe =>
      '$baseApiUrl/medication/reminderMeMedication';

  static String get verifyCodeForgotPassword =>
      '$baseApiUrl/password/verifCodeForgetPassword';

  static String get forgotPasswordWithCode =>
      '$baseApiUrl/password/forgotpasswordwithCode';

  static String get resetPasswordWithCode =>
      '$baseApiUrl/password/resetPasswordWithCode';
}
