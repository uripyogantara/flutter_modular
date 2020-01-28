import 'package:meta/meta.dart';

class NetworkModel {
  int code;

  Map<String, dynamic> response;

  String error;

  NetworkModel({
    @required this.code,
    @required this.response,
    @required this.error,
  });
}
