import 'package:flutter/material.dart';
import 'package:utility/navigation/spot.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      Spot().push(route.settings.name);
      // Log.info('Route Observer',
      //     'Push screen: \'${Spot().now()}\' (${Spot().nowTag()})');
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      Spot().pop();
      Spot().push(newRoute.settings.name);
      // Log.info('Route Observer',
      //     'Replace screen: \'${oldRoute.settings.name}\' (${Spot().tag(oldRoute.settings.name)}) to \'${Spot().now()}\' (${Spot().nowTag()})');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      Spot().pop();
      // Log.info('Route Observer',
      //     'Pop screen: \'${route.settings.name}\' (${Spot().tag(route.settings.name)}) to \'${previousRoute.settings.name}\' (${Spot().nowTag()})');
    }
  }
}
