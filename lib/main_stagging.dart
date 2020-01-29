import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/app.dart';
import 'package:flutter_modular/config/environment/env.dart';
import 'package:flutter_modular/init.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();
  // FlutterError.onError = Crashli
  // Crashlytics.instance.enableInDevMode = true;
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned(() {
    runApp(Init(
      configEnv: () => Env().setStaging(),
      appBuilder: (BuildContext context, Widget initialWidget) => MyApp(
        initialWidget: initialWidget,
      ),
    ));
  }, onError: null);
}
