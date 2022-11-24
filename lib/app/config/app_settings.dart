class SettingsApp {
  static String get baseUrl => 'http://192.168.1.14:8000';

  static String get apiPrefix => '/api';

  static String get baseApiUrl => baseUrl + apiPrefix;

  static String get loginUrl => '$baseApiUrl/auth/login';

  static String get registerUrl => '$baseApiUrl/auth/signUpClient';

  static String get logoutUrl => '$baseApiUrl/auth/logout';

  static String get changePasswordUrl =>
      '$baseApiUrl/password/changerPassword';

  static String get resetPasswordUrl => '$baseApiUrl/auth/refresh';

  static String get getUserProfile => '$baseApiUrl/user/userProfile';

  static String get editUserProfile => '$baseApiUrl/user/editProfile';

  static String get addCaregiver => '$baseApiUrl/auth/addCaregiver';

  static String get getAllCareGiver =>
      '$baseApiUrl/CaregiverSeizure/allCaregiverSeizure';

  static String get deleteCareGiver => '$baseApiUrl/user/editProfile';
}
