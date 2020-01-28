import 'package:config/injector/injector.dart';
import 'package:dio/dio.dart';
// import 'package:fazz_card/dependency_injection/injector.dart';
import 'package:utility/log/dio_logger.dart';

class NetworkLibrary {
  NetworkLibrary();

  static const String TAG = 'NetworkLibrary';

  static const int TIMEOUT_MILLISECOND = 7000;

  Dio buildStandardDio<T>(String userAgent, Map<String, String> headers) {
    //FazzTools fazzTools = FazzTools(host: '192.168.0.213', isDebug: true);
    var dio = Dio();
    //dio.interceptors.add(fazzTools.networkInspector.dioInspect);
    dio.options.connectTimeout = TIMEOUT_MILLISECOND;
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) {
        options.headers.addAll(headers);
        DioLogger.onSend(TAG, options);
        return options;
      }, onResponse: (Response response) {
        DioLogger.onSuccess(TAG, response);
        if (response.data is String && response.data.isEmpty) {
          response.data = Map<String, dynamic>();
        } else if (response.data is List) {
          response.data = {'list': response.data};
        }
        return response;
      }, onError: (DioError error) {
        DioLogger.onError(TAG, error);
        return error;
      }),
    );
    //add Alice Interceptors
    if (InjectorContainer().getAliceHelper().getAlice() != null) {
      dio.interceptors.add(
          InjectorContainer().getAliceHelper().getAlice().getDioInterceptor());
    }
    return dio;
  }
}
