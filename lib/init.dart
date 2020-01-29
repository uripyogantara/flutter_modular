import 'package:app_module/menu.dart';
import 'package:config/environment/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:config/injector/injector.dart';
import 'package:trust_fall/trust_fall.dart';
import 'package:utility/log/log.dart';

class Init extends StatelessWidget {
  final Function() configEnv;
  final Widget Function(BuildContext context, Widget initialRoute) appBuilder;

  Init({@required this.configEnv, @required this.appBuilder});

  Future init() async {
    configEnv();

    debugPaintSizeEnabled = false;

    // Trust Check
    if (Env().isBuildRelease()) {
      if (!await TrustFall.isRealDevice) {
        return 'fall';
      }
      if (await TrustFall.isJailBroken) {
        return 'fall';
      }
    }

    // init injector
    final InjectorContainer injector = InjectorContainer();
    injector.init();

    // TODO init database

    // init logger
    Log.init();
    Log.declareLevel();

    if (Env().isBuildDebug()) {
      //set Navigation key using Alice Navigator Key
      await injector.getAliceHelper().initialize();

      // Init NavigatorKey
      if (injector.getAliceHelper().getAlice() != null) {
        injector.getNavigationKeyService().setNavigatorKey(
            injector.getAliceHelper().getAlice().getNavigatorKey());
      }

      // TODO Init BlocDelegate
    }
    return 'nxt';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.toString().contains("fall")) {
            return Container();
          }
          return appBuilder(context, Menu());
        }
        return Container();
      },
    );
  }
}
