import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/utility/spot.dart';

class NavigationKeyHelper {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    navigatorKey = navigatorKey;
  }

  Future<dynamic> navigateToNamed(String route, {Object arguments}) {
    return navigatorKey.currentState.pushNamed(route, arguments: arguments);
  }

  Future<dynamic> navigateToNamedAndRemoveUntil(
      String route, String predicateRoute,
      {Object arguments}) {
    Spot().popUntil(predicateRoute);
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(predicateRoute),
      arguments: arguments,
    );
  }

  Future<dynamic> navigateToNamedAndRemoveElse(String route,
      {Object arguments}) {
    Spot().flush();
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateTo(Widget newPage, String routeName,
      {Object arguments, bool isInitialRoute = false}) {
    return navigatorKey.currentState.push(
      MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
          arguments: arguments,
          isInitialRoute: isInitialRoute,
        ),
        builder: (context) => newPage,
      ),
    );
  }

  Future<dynamic> replaceNamed(String route, {Object arguments}) {
    return navigatorKey.currentState
        .pushReplacementNamed(route, arguments: arguments);
  }

  bool pop([Object result]) {
    return navigatorKey.currentState.pop(result);
  }

  void popUntil(String predicatePath) {
    return navigatorKey.currentState
        .popUntil(ModalRoute.withName(predicatePath));
  }
}
