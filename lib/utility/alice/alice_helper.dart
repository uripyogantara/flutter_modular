import 'package:alice/alice.dart';
import 'package:flutter_modular/injector/injector.dart';
import 'package:flutter_modular/utility/saver/saver.dart';
import 'package:flutter_modular/utility/saver/saver_keys.dart';

class AliceHelper {
  Alice _alice;
  bool _hasAliceNotification;

  void _initAlice() {
    _alice = Alice(
      showNotification: _hasAliceNotification,
      navigatorKey: InjectorContainer().getNavigationKeyService().navigatorKey,
    );
  }

  Future<void> initialize() async {
    _hasAliceNotification = await Saver()
        .retrieve(SaverKeys.isAliceNotifShownKey)
        .then((data) => (data != null))
        .catchError((_) => false);

    _initAlice();
  }

  Future<String> toogledAlice() async {
    return await Saver()
        .save(SaverKeys.isAliceNotifShownKey, !_hasAliceNotification)
        .then((_) {
      _hasAliceNotification = !_hasAliceNotification;
      _initAlice();
      return null;
    }).catchError((_) => 'Turn on/off alice notification is failed');
  }

  Alice getAlice() => _alice;

  bool hasNotification() => _hasAliceNotification;
}
