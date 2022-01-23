class AuthorizationException implements Exception {
  final String msg;
  final Exception? err;

  const AuthorizationException([this.msg = '', this.err]);

  String toString() => 'Authorization error: $msg\n\n${err}';
}
