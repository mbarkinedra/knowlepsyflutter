//
//
// import 'package:get/get_navigation/src/routes/get_route.dart';
//
// import '../../presentation/bindings/bindings.dart';
//
// class AppRouting {
//   static String login = '/';
//   static String home = '/home';
//   static String search = '/search';
//   static String searchForm = '/search/form';
//   static String filter = '/filter';
//   static String localization = '/filter/localization';
//   static String category = '/filter/category';
//   static String adDetails = '/adDetails';
//   static String adReport = '/report-ad';
//   static String adReportSuccess = '/report-ad/success';
//   static String similarAds = '/similar-ads';
//   static String newAd = '/new-ad';
//   static String myAds = '/my-ads';
//   static String account = '/account';
//   static String profile = '/account/profile';
//   static String messages = '/account/messages';
//   static String favorites = '/account/favorites';
//   static String preferences = '/account/preferences';
//   static String notifications = '/account/notifications';
//   static String changePassword = '/personal-information/change-password';
//   static String deleteAccount = '/account/delete-account';
//   static String deleteAccountSuccess = '/account/delete-account/success';
//   static String login = '/login';
//   static String loginSuccess = '/login/success';
//   static String signUp = '/sign-up';
//   static String signUpSuccess = '/sign-up/success';
//   static String passwordForgot = '/password-forgot';
//
//   static String settings = '/settings';
//
//   static List<GetPage> pages = [
//     GetPage(name: home, page: () => HomeView(), binding: AllBindings()),
//     GetPage(
//         name: search, page: () => const SearchView(), binding: AllBindings()),
//     GetPage(
//         name: searchForm, page: () => SearchFormView(), binding: AllBindings()),
//     GetPage(
//         name: filter, page: () => const FilterView(), binding: AllBindings()),
//     GetPage(
//         name: localization,
//         page: () => const LocalizationView(),
//         binding: AllBindings()),
//     GetPage(
//       name: category,
//       page: () => const CategoryGroupView(),
//       binding: AllBindings(),
//     ),
//     GetPage(
//       name: adDetails,
//       page: () => AdvertDetailsView(),
//       binding: AllBindings(),
//     ),
//     GetPage(
//       name: adReport,
//       page: () => ReportAdvertView(),
//       binding: AllBindings(),
//     ),
//     GetPage(
//       name: adReportSuccess,
//       page: () => ReportSuccessView(),
//       binding: AllBindings(),
//     ),
//     GetPage(
//       name: similarAds,
//       page: () => SimilarAdvertsView(),
//       binding: AllBindings(),
//     ),
//     GetPage(name: myAds, page: () => MyAdsView(), binding: AllBindings()),
//     GetPage(name: newAd, page: () => TapPublishScr(), binding: AllBindings()),
//     GetPage(
//       name: favorites,
//       page: () => FavoriteView(),
//       binding: AllBindings(),
//     ),
//     GetPage(name: account, page: () => TapProfileScr(), binding: AllBindings()),
//     GetPage(name: profile, page: () => AccountView(), binding: AllBindings()),
//     GetPage(name: settings, page: () => SettingsView(), binding: AllBindings()),
//     GetPage(
//         name: changePassword,
//         page: () => ChangePasswordView(),
//         binding: AllBindings()),
//     GetPage(name: messages, page: () => TapChatScr(), binding: AllBindings()),
//     GetPage(
//         name: notifications,
//         page: () => NotificationView(),
//         binding: AllBindings()),
//     GetPage(
//         name: preferences,
//         page: () => NotificationSettingsView(),
//         binding: AllBindings()),
//     GetPage(
//         name: loginSuccess,
//         page: () => const LoginSuccessView(),
//         binding: AllBindings()),
//     GetPage(name: signUp, page: () => SignUpScr(), binding: AllBindings()),
//
//     GetPage(
//         name: deleteAccount,
//         page: () => DeleteAccountView(),
//         binding: AllBindings()),
//     GetPage(
//         name: deleteAccountSuccess,
//         page: () => DeleteAccountSuccessView(),
//         binding: AllBindings()),
//   ];
//
//   static GetPage getPageByName(String name) {
//     return pages.firstWhere((p) => p.name == name);
//   }
//
//   static List<String> getPageNames() {
//     List<String> names = <String>[];
//
//     for (GetPage element in pages) {
//       names.add(element.name);
//     }
//
//     return names;
//   }
// }
