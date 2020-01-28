import 'dart:typed_data';

import 'package:app_module/data/authorization_token.dart';
import 'package:config/environment/env.dart';
import 'package:config/network/network_library.dart';
import 'package:config/network/network_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class NetworkInterface {
  String userAgent = '';

  String osType = '';

  AuthorizationToken authorization = AuthorizationToken.initial();

  NetworkLibrary library = NetworkLibrary();

  NetworkInterface({this.userAgent});

  Future<NetworkModel> requestGetNoAuth({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    baseUrl = baseUrl ?? Env().baseUrl;
    NetworkModel model;
    try {
      model = await library
          .buildStandardDio(userAgent, _buildBasicHeader(userAgent, osType))
          .get("$baseUrl$path", queryParameters: queryParameters)
          .then((jsonResponse) {
        return NetworkModel(
          code: jsonResponse.statusCode,
          response: jsonResponse.data,
          error: '',
        );
      });
    } on DioError catch (e) {
      model = handleError(e, model);
    }
    return model;
  }

  Future<NetworkModel> requestAuthToken({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseAuthUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(
                userAgent,
                _buildUrlEncodedHeader(
                  userAgent,
                  osType,
                ))
            .post(
              "$baseUrl$path",
              data: queryParameters,
              options: Options(
                contentType: "application/x-www-form-urlencoded",
              ),
            )
            .then((jsonResponse) {
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Future<NetworkModel> requestPostNoAuth({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseAuthUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(userAgent, _buildBasicHeader(userAgent, osType))
            .post("$baseUrl$path", data: queryParameters)
            .then((jsonResponse) {
          //return NetworkModel(jsonResponse.statusCode, jsonResponse.data, '');
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Future<NetworkModel> requestPostBinary(
      {String baseUrl, String path, Uint8List data}) async {
    {
      baseUrl = baseUrl ?? Env().baseAuthUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(userAgent, _buildBinaryHeader(data.length))
            .post("$baseUrl$path",
                data: Stream.fromIterable(data.map((e) => [e])))
            .then((jsonResponse) {
          //return NetworkModel(jsonResponse.statusCode, jsonResponse.data, '');
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Future<NetworkModel> requestPatchNoAuth({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseAuthUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(userAgent, _buildBasicHeader(userAgent, osType))
            .patch("$baseUrl$path", data: queryParameters)
            .then((jsonResponse) {
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Future<NetworkModel> requestPatch({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(userAgent,
                _buildAuthHeader(authorization.authToken, userAgent, osType))
            .patch("$baseUrl$path", data: queryParameters)
            .then((jsonResponse) {
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Future<NetworkModel> requestGet({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(
                userAgent,
                _buildAuthHeader(
                  authorization.authToken ?? '',
                  userAgent,
                  osType,
                ))
            .get("$baseUrl$path", queryParameters: queryParameters)
            .then((jsonResponse) {
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Future<NetworkModel> requestDelete({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseUrl;
      NetworkModel model;

      try {
        model = await library
            .buildStandardDio(
                userAgent,
                _buildAuthHeader(
                  authorization.authToken,
                  userAgent,
                  osType,
                ))
            .delete('$baseUrl$path', queryParameters: queryParameters)
            .then((jsonResponse) {
          return NetworkModel(
            code: jsonResponse.statusCode,
            response: jsonResponse.data,
            error: '',
          );
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }

      return model;
    }
  }

  NetworkModel handleError(DioError e, NetworkModel model) {
    try {
      if (e.response != null) {
        //print('Network Error ${e.response.data['message']}');
        model = NetworkModel(
          code: e.response.statusCode ?? 0,
          response: Map(),
          error: (e.response.data.runtimeType is Map ||
                  e.response.data.toString()[0] == "{")
              ? e.response.data['error'] ??
                  e.response.data['message'] ??
                  'Gagal terhubung, silahkan coba beberapa saat lagi'
              : 'Gagal terhubung, silahkan coba beberapa saat lagi',
        );
      } else
        model = NetworkModel(
            code: 0,
            response: Map(),
            error: 'Gagal terhubung, silahkan coba beberapa saat lagi');
    } catch (exception, _) {
      model = NetworkModel(
          code: 0,
          response: Map(),
          error: 'Gagal terhubung, silahkan coba beberapa saat lagi');
    }
    return model;
  }

  Future<NetworkModel> requestPost({
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  }) async {
    {
      baseUrl = baseUrl ?? Env().baseUrl;
      NetworkModel model;
      try {
        model = await library
            .buildStandardDio(userAgent,
                _buildAuthHeader(authorization.authToken, userAgent, osType))
            .post("$baseUrl$path", data: queryParameters)
            .then((jsonResponse) {
          return NetworkModel(
              code: jsonResponse.statusCode,
              response: jsonResponse.data,
              error: '');
        });
      } on DioError catch (e) {
        model = handleError(e, model);
      }
      return model;
    }
  }

  Map<String, String> _buildUrlEncodedHeader(String userAgent, String osType) {
    var headers = Map<String, String>();
    headers.putIfAbsent("Authorization", () {
      return Env().basicAuth;
    });
    headers.putIfAbsent("content-type", () {
      return "application/x-www-form-urlencoded";
    });
    headers.putIfAbsent("client-id", () {
      return Env().clientId;
    });
    headers.putIfAbsent("client-secret", () {
      return Env().clientSecret;
    });
    headers.putIfAbsent("User-Agent", () {
      return userAgent;
    });
    headers.putIfAbsent("os-type", () {
      return osType;
    });
    headers.putIfAbsent("Accept-Encoding", () {
      return '*/*';
    });
    return headers;
  }

  Map<String, String> _buildBasicHeader(String userAgent, String osType) {
    var headers = Map<String, String>();
    headers.putIfAbsent("Authorization", () {
      return Env().basicAuth;
    });
    headers.putIfAbsent("content-type", () {
      return "application/json";
    });
    headers.putIfAbsent("client-id", () {
      return Env().clientId;
    });
    headers.putIfAbsent("client-secret", () {
      return Env().clientSecret;
    });
    headers.putIfAbsent("User-Agent", () {
      return userAgent;
    });
    headers.putIfAbsent("os-type", () {
      return osType;
    });
    return headers;
  }

  Map<String, String> _buildBinaryHeader(int length) {
    var headers = Map<String, String>();
    headers.putIfAbsent("accept", () {
      return "application/json";
    });

    headers.putIfAbsent("content-type", () {
      return "image/jpeg";
    });

    headers.putIfAbsent("content-length", () {
      return length.toString();
    });
    return headers;
  }

  Map<String, String> _buildAuthHeader(
      String token, String userAgent, String osType) {
    var headers = Map<String, String>();
    headers.putIfAbsent("Authorization", () {
      return token;
    });
    headers.putIfAbsent("content-type", () {
      return "application/json";
    });
    headers.putIfAbsent("client-id", () {
      return Env().clientId;
    });
    headers.putIfAbsent("client-secret", () {
      return Env().clientSecret;
    });
    headers.putIfAbsent("User-Agent", () {
      return userAgent;
    });
    headers.putIfAbsent("os-type", () {
      return osType;
    });
    return headers;
  }

  void setAuthorization(AuthorizationToken token) {
    this.authorization = token;
  }

  void setDevicePreference({
    @required String userAgent,
    @required String osType,
  }) {
    this.userAgent = userAgent;
    this.osType = osType;
  }
}
