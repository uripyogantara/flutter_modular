import 'package:flutter_modular/config/network/network_interface.dart';
import 'package:flutter_modular/config/network_gql/network_interface_gql.dart';
import 'package:flutter_modular/injector/injector.dart';

abstract class CoreRestService {
  final NetworkInterface networkInterface =
      InjectorContainer().getNetworkInterfaceInstance();
}

abstract class CoreGqlService {
  // final NetworkInterfaceGraphql networkInterfaceGQL =
  //     InjectorContainer().getNetworkInterfaceGraphqlInstance();
}
