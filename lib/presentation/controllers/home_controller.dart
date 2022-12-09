import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/presentation/pages/home/setting_page/setting_page.dart';

import '../pages/home/home_page/home_page.dart';
import '../pages/home/medecine_page/medecine_page.dart';
import '../pages/home/seizure_page/seizure_page.dart';

class HomeController extends GetxController {
  PageController pageController = PageController( );
  int pageNumber = 0;
  int initialPage=0;
  updatePageChaing(int i) {
    pageNumber = i;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  int _navigatorValue = 0;
  String _currentPage = 'Page1';
  late var _navigatorKey;

  List<String> _pageKeys = ['Page1', 'Page2', 'Page3', 'Page4'];

  get navigatorValue => _navigatorValue;

  get currentPage => _currentPage;

  get navigatorKey => _navigatorKey;

  get navigatorKeys => _navigatorKeys;

  get pageKeys => _pageKeys;
  static final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'Page1': GlobalKey<NavigatorState>(),
    'Page2': GlobalKey<NavigatorState>(),
    'Page3': GlobalKey<NavigatorState>(),
    'Page4': GlobalKey<NavigatorState>(),
  };

  Widget currentScreen = Container();

  @override
  void onInit() {
    super.onInit();
    currentScreen = PageToView(
      naigatorKey: _navigatorKeys[_pageKeys[0]]!,
      tabItem: _pageKeys[0],
    ); //=HomeView();
  }

  changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    _currentPage = _pageKeys[selectedValue];
    _navigatorKey = _navigatorKeys[_currentPage];

    currentScreen = PageToView(
      naigatorKey: _navigatorKey,
      tabItem: _currentPage,
    );

    update();
  }

  Widget buildoffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: PageToView(
        naigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}

class PageToView extends StatelessWidget {
  late GlobalKey<NavigatorState> naigatorKey;
  late String tabItem;

  PageToView({required this.naigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = Container();

    switch (tabItem) {
      case 'Page1':
        {
          currentScreen =   HomePage1();

          break;
        }
      case 'Page2':
        {
          currentScreen = SeizurePage();

          break;
        }
      case 'Page3':
        {
          currentScreen = MedecinePage();
          break;
        }
      case 'Page4':
        {
          currentScreen = SettingPage();
          break;
        }
    }

    return Navigator(
      key: naigatorKey,
      onGenerateRoute: (routeStings) {
        return MaterialPageRoute(builder: (context) => currentScreen);
      },
    );
  }
}
