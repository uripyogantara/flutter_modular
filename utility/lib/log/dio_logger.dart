import 'package:dio/dio.dart';
import 'package:utility/log/log.dart';

class DioLogger {
  static void onSend(String tag, RequestOptions options) {
    Log.info(tag,
        'Request Path: [${options.method}] ${options.baseUrl}${options.path}');
    Log.info(tag, 'Request Data: ${options.data.toString()}');
    Log.info(tag, 'Request Header: ${options.headers}');
  }

  static void onSuccess(String tag, Response response) {
    Log.info(tag,
        'Response Path: [${response.request.method}] ${response.request.baseUrl}${response.request.path} Request Data : ${response.request.data.toString()}');
    Log.info(tag, 'Response statusCode: ${response.statusCode}');
    Log.info(tag, 'Response data: ${response.data.toString()}');
  }

  static void onError(String tag, DioError error) {
    if (null != error.response) {
      Log.warning(tag,
          'Error Path: [${error.response.request.method}] ${error.response.request.baseUrl}${error.response.request.path} Request Data : ${error.response.request.data.toString()}');
      Log.warning(tag, 'Error statusCode: ${error.response.statusCode}');
      Log.warning(tag,
          'Error data: ${null != error.response.data ? error.response.data.toString() : ''}');
    }
    Log.warning(tag, 'Error Message: ${error.message}');
  }
}
