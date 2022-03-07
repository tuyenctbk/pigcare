import 'package:flutter/material.dart';
import 'package:pig_care/src/ui/page_controller.dart';
import 'package:pig_care/src/ui/pig_board_screen.dart';
import 'package:pig_care/src/ui/splash_screen.dart';
import 'package:pig_care/src/ui/warning_setting_screen.dart';

import 'router_observer.dart';

const String homeRoute = Navigator.defaultRouteName;
const String splashRoute = '/splashRoute';
const String pigStatus = '/pigStatus';
const String warningConfig = '/warnConfig';
const String history = '/history';

final navigatorKey = GlobalKey<NavigatorState>();

class Router {
  static final Router _singleton = Router._internal();
  final routerObserver = RouterObserver();

  factory Router() => _singleton;

  Router._internal();

  NavigatorState? get appNavigatorState => routerObserver.navigator;

  Route<dynamic> generateRoute(RouteSettings settings) {
    final Widget screen;
    switch (settings.name) {
      case splashRoute:
        screen = SplashScreen();
        break;
      case homeRoute:
        screen = MyPageController();
        break;
      case warningConfig:
        screen = WarningSettingScreen();
        break;
      default:
        screen = Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
        break;
    }
    return MaterialPageRoute(builder: (_) => screen);
  }

  String? get name => routerObserver.name;
}
