// LandingPage use to define dialog, session, fcm, remote config, forceupdate, shake event

import 'package:flutter/widgets.dart';

class Landing extends StatefulWidget {
  static const String PATH = '/';
  static const String TAG = 'Landing';
  final Widget initialWidget;

  Landing({@required this.initialWidget});

  @override
  State<StatefulWidget> createState() {
    return LandingState();
  }
}

class LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return widget.initialWidget;
  }
}
