import 'package:config/network_gql/data/gql_code.dart';
import 'package:config/network_gql/data/gql_data.dart';

class NetworkModelGql {
  GqlData response;
  String error;
  GqlCode code;

  NetworkModelGql({
    this.response,
    this.error = '',
    this.code = GqlCode.Undefined,
  });
}
