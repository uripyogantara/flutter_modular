// import 'package:fazz_card/config/network/network_interface.dart';
// import 'package:fazz_card/config/network_gql/network_interface_gql.dart';
// import 'package:fazz_card/dependency_injection/injector.dart';

import 'package:config/injector/injector.dart';
import 'package:config/network/network_interface.dart';

abstract class CoreRestService {
  final NetworkInterface networkInterface =
      InjectorContainer().getNetworkInterfaceInstance();
}

abstract class CoreGqlService {
  // final NetworkInterfaceGraphql networkInterfaceGQL =
  //     InjectorContainer().getNetworkInterfaceGraphqlInstance();
}
