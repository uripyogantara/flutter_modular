import 'package:flutter/material.dart';
import 'package:flutter_modular/route/route.dart';

class MyApp extends StatefulWidget {
  final Widget initialWidget;
  MyApp({this.initialWidget});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Routes(
      initialWidget: widget.initialWidget,
      navigatorKey: navigatorKey,
    );
  }

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
