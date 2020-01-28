import 'package:utility/navigation/spot.dart';
import 'package:logging/logging.dart';

// ignore_for_file: avoid_print
class Log {
  static const String _NAME = 'Logger';
  static Logger _instance;

  static void init() {
    Logger.root.onRecord.listen((record) {
      // print('${record.level.name}: ${record.time}: ${record.message}');
      print('${record.level.name}: ${record.message}');
    });
    _instance = Logger(_NAME);
  }

  static void setLevel(Level level) {
    Logger.root.level = level;
  }

  static void info([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.info('$tag - $message', error, stackTrace);
  }

  static void warning([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.warning('$tag - $message', error, stackTrace);
  }

  static void config([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.config('$tag - $message', error, stackTrace);
  }

  static void fine([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.fine('$tag - $message', error, stackTrace);
  }

  static void finer([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.finer('$tag - $message', error, stackTrace);
  }

  static void finest({tag, message, Object error, StackTrace stackTrace}) {
    tag = tag ?? Spot().nowTag();
    _instance.finest('$tag - $message', error, stackTrace);
  }

  static void severe([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.severe('$tag - $message', error, stackTrace);
  }

  static void shout([tag, message, Object error, StackTrace stackTrace]) {
    tag = tag ?? Spot().nowTag();
    _instance.shout('$tag - $message', error, stackTrace);
  }
}
