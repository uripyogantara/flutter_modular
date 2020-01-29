import 'package:flutter_modular/config/network/network_interface.dart';
import 'package:flutter_modular/utility/alice/alice_helper.dart';
import 'package:flutter_modular/utility/navigation/navigation_helper.dart';
import 'package:kiwi/kiwi.dart';

class InjectorContainer {
  static Container _container;

  NetworkInterface getNetworkInterfaceInstance() {
    init();
    return _container.resolve<NetworkInterface>();
  }

  NavigationKeyHelper getNavigationKeyService() {
    init();
    return _container.resolve<NavigationKeyHelper>();
  }

  AliceHelper getAliceHelper() {
    final Container container = Container();

    return container.resolve<AliceHelper>();
  }

  void clear() {
    if (_container != null) {
      _container.clear();
      _container = null;
    }
  }

  void init() {
    if (_container == null) {
      print("init injector from core");
      _container = Container();
      _container.registerInstance(NetworkInterface());
      _container.registerInstance(NavigationKeyHelper());
      _container.registerInstance(AliceHelper());
    }
  }
}
