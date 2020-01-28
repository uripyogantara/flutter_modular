import 'package:cashloan_module/main.dart';
import 'package:cashloan_module/page/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/page/landing.dart';
import 'package:flutter_modular/route/route_observer.dart';
import 'package:utility/navigation/spot.dart';

class Routes extends StatelessWidget {
  final Widget initialWidget;
  final GlobalKey<NavigatorState> navigatorKey;
  Routes({@required this.initialWidget, @required this.navigatorKey})
      : assert(initialWidget != null);

  @override
  Widget build(BuildContext context) {
    Spot().registerTags({
      Landing.PATH: Landing.TAG,
      CashloanPage.PATH: CashloanPage.TAG,
      NewsPage.PATH: NewsPage.TAG

      // // Put new route in this branch if it haven't self route branch
      // ...unsortedRouteBranchTAG,

      // // Put debug only route here
      // ...debugRouteBranchTAG,

      // ...loginRouteBranchTAG,
      // ...financialProductRouteBranchTAG,
      // ...registerRouteBranchTAG,
      // ...forgetPinRouteBranchTAG,
      // ...changeNameRouteBranchTAG,
      // ...changePinRouteBranchTAG,
      // ...helpRouteBranchTAG,
      // ...surveyRouteBranchTAG,
      // ...cashloanRouteBranchTAG,
      // ...reportCashbackRouteBranchTAG,
      // ...withdrawRouteBranchTAG,
      // ...sobatkuRouteBranchTAG,
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      navigatorObservers: [MyRouteObserver()],
      initialRoute: Landing.PATH,
      routes: <String, WidgetBuilder>{
        Landing.PATH: (_) => Landing(
              initialWidget: initialWidget,
            ),
        CashloanPage.PATH: (_) => CashloanPage(),
        NewsPage.PATH: (_) => NewsPage()

        // // Put new route in this branch if it haven't self route branch
        // ...unsortedRouteBranch,

        // // Put debug only route here
        // ...debugRouteBranch,

        // ...loginRouteBranch,
        // ...financialProductRouteBranch,
        // ...registerRouteBranch,
        // ...forgetPinRouteBranch,
        // ...changeNameRouteBranch,
        // ...changePinRouteBranch,
        // ...helpRouteBranch,
        // ...surveyRouteBranch,
        // ...cashloanRouteBranch,
        // ...reportCashbackRouteBranch,
        // ...withdrawRouteBranch,
        // ...sobatkuRouteBranch,
      },
      title: 'Nue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
