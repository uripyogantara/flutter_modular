// Error 401
class UnauthorizedException implements Exception {
  final message;
  final code = 401;
  UnauthorizedException({this.message = 'Unauthorized'});
}