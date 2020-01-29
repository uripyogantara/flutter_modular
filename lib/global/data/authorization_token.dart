class AuthorizationToken {
  final String authToken;
  final String refreshToken;
  final int expiresIn;

  AuthorizationToken({
    this.authToken,
    this.refreshToken, // Not fcm refresh token
    this.expiresIn,
  });

  static AuthorizationToken initial() {
    return AuthorizationToken(authToken: '', refreshToken: '', expiresIn: 0);
  }
}
