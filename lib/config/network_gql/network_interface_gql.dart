import 'package:config/network_gql/data/gql_code.dart';
import 'package:config/network_gql/data/gql_data.dart';
import 'package:config/network_gql/network_model_gql.dart';
import 'package:config/environment/env.dart';
import 'package:app_module/data/authorization_token.dart';
// import 'package:fazz_card/page/shake_debug/gql_inspector/data/gql_logger_model.dart';
// import 'package:fazz_card/page/shake_debug/gql_inspector/gql_inspector.dart';
import 'package:utility/log/graphql_logger.dart';
import 'package:utility/log/log.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class NetworkInterfaceGraphql {
  static const String TAG = 'NetworkInterfaceGraphql';
  // TODO implement gql inspector
  // GqlInspector gqlInspector = GqlInspector();

  String userAgent = '';

  String osType = '';

  int _timeoutSecond = 7;

  AuthorizationToken authorization = AuthorizationToken.initial();

  Future<NetworkModelGql> queryAuthToken({
    String baseUrl,
    String query,
    Map<String, dynamic> variables,
  }) async {
    baseUrl = baseUrl ?? Env().baseUrlGql;
    var header = _buildAuthHeader(
      authorization.authToken,
      userAgent,
      osType,
    );
    final HttpLink _httpLink = HttpLink(
      uri: baseUrl,
      headers: header,
    );

    final GraphQLClient _client = GraphQLClient(
      link: _httpLink,
      cache: InMemoryCache(),
    );

    final QueryOptions _options = QueryOptions(
      documentNode: gql(query),
      variables: variables,
    );

    try {
      GraphqlLogger.onSend(TAG, 'Query', baseUrl, header, _options);
      return await _client
          .query(_options)
          .timeout(Duration(seconds: _timeoutSecond))
          .then((_result) {
        if (_result.hasException) {
          // gqlInspector.addToInspector(GqlLoggerModel(
          //   response: _result.exception.graphqlErrors.single.message,
          //   query: _options.documentNode.toString(),
          //   path: baseUrl,
          //   gqlMethod: 'Query',
          //   gqlCode: _onError(_result.exception.graphqlErrors.single).code,
          // ));
          Log.warning(TAG, 'Query : ${_result.exception.graphqlErrors}');
          GraphqlLogger.onError(
              TAG, 'Query', baseUrl, _result.exception.graphqlErrors.single);
          return _onError(_result.exception.graphqlErrors.single);
        }

        if (_result.data is Map) {
          // gqlInspector.addToInspector(GqlLoggerModel(
          //   response: _result.data.toString(),
          //   query: _options.documentNode.toString(),
          //   path: baseUrl,
          //   gqlMethod: 'Query',
          //   gqlCode: GqlCode.Success,
          // ));
          GraphqlLogger.onSuccess(TAG, 'Query', baseUrl, _result);
          return NetworkModelGql(
            code: GqlCode.Success,
            response: GqlQuery.parse(_result.data),
            error: '',
          );
        } else {
          return NetworkModelGql(
            response: null,
            error: '',
          );
        }
      });
    } catch (e) {
      Log.warning(TAG, 'Error Message: ${e.toString()}');
      return _onUnidentifiedError(e.toString());
    }
  }

  Future<NetworkModelGql> mutationAuthToken({
    String baseUrl,
    String query,
    Map<String, dynamic> variables,
  }) async {
    baseUrl = baseUrl ?? Env().baseUrlGql;
    var header = _buildAuthHeader(
      authorization.authToken,
      userAgent,
      osType,
    );
    final HttpLink _httpLink = HttpLink(
      uri: baseUrl,
      headers: header,
    );

    final GraphQLClient _client = GraphQLClient(
      link: _httpLink,
      cache: InMemoryCache(),
    );

    final MutationOptions _options = MutationOptions(
      documentNode: gql(query),
      variables: variables,
    );

    try {
      GraphqlLogger.onSend(TAG, 'Mutation', baseUrl, header, _options);
      return await _client
          .mutate(_options)
          .timeout(Duration(seconds: _timeoutSecond))
          .then((_result) {
        if (_result.hasException) {
          // gqlInspector.addToInspector(GqlLoggerModel(
          //   response: _result.exception.graphqlErrors.single.message,
          //   query: _options.documentNode.toString(),
          //   path: baseUrl,
          //   gqlMethod: 'Mutation',
          //   gqlCode: _onError(_result.exception.graphqlErrors.single).code,
          // ));
          Log.warning(TAG, 'Mutation : ${_result.exception.graphqlErrors}');
          GraphqlLogger.onError(
              TAG, 'Mutation', baseUrl, _result.exception.graphqlErrors.single);
          return _onError(_result.exception.graphqlErrors.single);
        }

        if (_result.data is Map) {
          // gqlInspector.addToInspector(GqlLoggerModel(
          //   response: _result.data.toString(),
          //   query: _options.documentNode.toString(),
          //   path: baseUrl,
          //   gqlMethod: 'Mutation',
          //   gqlCode: GqlCode.Success,
          // ));
          GraphqlLogger.onSuccess(TAG, 'Mutation', baseUrl, _result);
          return NetworkModelGql(
            code: GqlCode.Success,
            response: GqlMutation.parse(_result.data),
            error: '',
          );
        } else {
          return NetworkModelGql(
            response: null,
            error: '',
          );
        }
      });
    } catch (e) {
      Log.warning(TAG, 'Error Message: ${e.toString()}');
      return _onUnidentifiedError(e.toString());
    }
  }

  //Below are method taken from network_interface
  Map<String, String> _buildBasicHeader(String userAgent, String osType) {
    var headers = Map<String, String>();
    headers.putIfAbsent("Authorization", () {
      return Env().basicAuth;
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

  Map<String, String> _buildAuthHeader(
      String token, String userAgent, String osType) {
    var headers = Map<String, String>();
    headers.putIfAbsent("Authorization", () {
      return token;
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
    headers.putIfAbsent("Content-Type", () {
      return "application/json";
    });
    return headers;
  }

  NetworkModelGql _onError(GraphQLError error) {
    return NetworkModelGql(
      code: _errorCode(error),
      error: _errorMessage(error.message),
    );
  }

  NetworkModelGql _onUnidentifiedError(String e) {
    return NetworkModelGql(
      error: _errorMessage(e),
      code: _errorCodeByMessage(e),
    );
  }

  GqlCode _errorCodeByMessage(String e) {
    if (e.contains('Failed host lookup') ||
        e.contains('getter \'host\' was called on null')) {
      return GqlCode.Offline;
    } else if (e.contains('timeout') || e.contains('TimeoutException')) {
      return GqlCode.ConnectionTimeout;
    }
    return GqlCode.Undefined;
  }

  GqlCode _errorCode(GraphQLError error) {
    if (error.extensions != null && error.extensions['code'] != null) {
      switch (error.extensions['code']) {
        case 'UNAUTHENTICATED':
          return GqlCode.Unauthenticated;
          break;
        case 'INTERNAL_SERVER_ERROR':
          return GqlCode.InternalServerError;
          break;
        case 'UNPROCESSABLE_ENTITY':
          return GqlCode.UnprocessableEntity;
          break;
        case 'GRAPHQL_VALIDATION_FAILED':
          return GqlCode.ValidationFailed; // Wrong query sended to gql
          break;
        case 'EMPTY_DATA':
        case 'DATA_NOT_FOUND':
          return GqlCode.DataNotFound;
          break;
      }
    } else {
      return _errorCodeByMessage(error.message);
    }
    return GqlCode.Undefined;
  }

  String _errorMessage(String message) {
    if (message != null) {
      if (message.contains('Failed host lookup') ||
          message.contains('getter \'host\' was called on null') ||
          message.contains('timeout') ||
          message.contains('TimeoutException')) {
        return 'Gagal terhubung, periksa koneksi jaringan anda';
      }
      return message;
    }
    return 'Gagal terhubung, silahkan coba beberapa saat lagi';
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
