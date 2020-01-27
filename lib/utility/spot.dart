// import 'package:fazz_card/utility/log/log.dart';

/*  
    Active route tracker 
    - Get the current visible page route
    - Get all active and in background route
    - Get root of route
    - Get active route's tag
*/

class Spot {
  Spot._();
  static final Spot _instance = Spot._();
  factory Spot() {
    return _instance;
  }

  // List of active route
  List<String> _paths = [];

  // List Of Route's Tag
  Map<String, String> _pathTags = {};

  // Register All Route's Tag
  registerTags(Map<String, String> pathTags) => _pathTags = pathTags;

  // Get the root of active route path
  String root() => _paths.first;

  // Get the current active route path
  String now() => _paths.last;

  // Get current visible path name
  String nowTag() => _pathTags[_paths.last] ?? "Undefined";

  // Get path tag name
  String tag(String path) => _pathTags[path] ?? "Undefined";

  // Clear all active route
  flush() {
    _paths.clear();
  }

  // Check if there is an active route
  bool isEmpty() => _paths.isEmpty;

  // Get total active route
  int depth() => _paths.length;

  // Check if route is active
  bool hasPath(String path) => _paths.contains(path);

  // Get path position
  int position(String path) => _paths.lastIndexOf(path);

  // Get all active route
  List<String> getPaths() => _paths;

  push(String path) {
    _paths.add(path);
  }

  String pop() => _paths.removeLast();

  bool popUntil(String path) {
    bool isSuccess = false;
    if (hasPath(path)) {
      int idx = position(path);
      if (idx != -1) {
        _paths.removeRange(idx + 1, _paths.length);
        isSuccess = true;
      }
    }
    // Log.info('Spot', 'Pop until is success: $isSuccess');
    return isSuccess;
  }

  bool popUntilThenPush(String path, String newPath) {
    bool isSuccess = popUntil(path);
    if (isSuccess) push(newPath);
    // Log.info('Spot', 'Pop until then push is success: $isSuccess');
    return isSuccess;
  }
}
