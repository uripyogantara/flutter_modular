// Error 500
class InternalServerException implements Exception {
  final message;
  final code = 500;
  InternalServerException({this.message = 'Internal Server Error'});
}