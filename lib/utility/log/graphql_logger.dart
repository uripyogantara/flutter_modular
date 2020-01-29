import 'package:flutter_modular/utility/log/log.dart';
import 'package:graphql/client.dart';

class GraphqlLogger {
  static void onSend(String tag, String method, String url,
      Map<String, dynamic> headers, BaseOptions options) {
    Log.info(tag, 'Request Path: [$method] $url');
    Log.info(tag, 'Request Data: ${options.document} ${options.variables}');
    Log.info(tag, 'Request Header: $headers');
  }

  static void onSuccess(
      String tag, String method, String url, QueryResult response) {
    Log.info(tag, 'Request Path: [$method] $url');
    Log.info(tag, 'Response: ${response.data}');
  }

  static void onError(
      String tag, String method, String url, GraphQLError error) {
    if (error != null) {
      Log.warning(tag, 'Error Path: [$method] $url');
      Log.warning(tag,
          'Error code: ${(error.extensions != null && error.extensions['code'] != null) ? error.extensions['code'] : error.message.contains('Failed host lookup') ? "Offline" : error.message.contains('timeout') ? "Connection Timeout" : "Undefined"}');
    }
    Log.warning(tag, 'Error Message: ${error.message}');
  }
}
