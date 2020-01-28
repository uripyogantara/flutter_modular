import 'package:app_module/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:config/injector/injector.dart';
import 'package:utility/log/log.dart';
// import 'package:flutter_modular/injector/injector.dart';
// import 'package:flutterarchitecture/page/menu.dart';

// import 'package:core_module/core_module.dart';

class Init extends StatelessWidget {
  final Function() configEnv;
  final Widget Function(BuildContext context, Widget initialRoute) appBuilder;

  Init({@required this.configEnv, @required this.appBuilder});

  Future init() async {
    configEnv();

    debugPaintSizeEnabled = false;

    // TODO Trust Check
    // if (Env().isBuildRelease()) {
    //   if (!await TrustFall.isRealDevice) {
    //     return 'fall';
    //   }
    //   if (await TrustFall.isJailBroken) {
    //     return 'fall';
    //   }
    // }

    // TODO init injector
    InjectorContainer().init();

    // TODO init database

    // TODO init logger
    Log.init();

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
