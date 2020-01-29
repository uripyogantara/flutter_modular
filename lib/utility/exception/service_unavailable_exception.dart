// Error 503
class ServiceUnavailableException implements Exception {
  final message;
  final code = 503;
  ServiceUnavailableException({this.message = 'Service Unavailable'});
}