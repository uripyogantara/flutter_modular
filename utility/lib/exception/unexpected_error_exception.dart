// Other error code
class UnexpectedErrorException implements Exception {
  final message;
  final code;
  UnexpectedErrorException(
      {this.message = 'Gagal terhubung, silahkan coba beberapa saat lagi',
      this.code = 0});
}
