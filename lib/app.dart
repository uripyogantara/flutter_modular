import 'package:config/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:config/route/route.dart';

class MyApp extends StatefulWidget {
  final Widget initialWidget;
  MyApp({this.initialWidget});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navigatorKey =
      InjectorContainer().getNavigationKeyService().navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Routes(
      initialWidget: widget.initialWidget,
      navigatorKey: navigatorKey,
    );
  }

  // TODO implement multi bloc provider
  // MultiBlocProvider buildMainBlocProviders() {
  //   return MultiBlocProvider(
  //     providers: [],
  //     child: Routes(
  //       initialWidget: widget.initialWidget,
  //       navigatorKey: navigatorKey,
  //     ),
  //   );
  // }
}
