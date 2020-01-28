import 'package:kiwi/kiwi.dart';
import 'package:config/network/network_interface.dart';
import 'package:utility/navigation/navigation_helper.dart';

// TODO extends Base Injector
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
    }
  }
}
