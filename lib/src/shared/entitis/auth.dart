import 'package:equatable/equatable.dart';

/// accessToken : "string"
/// refreshToken : "string"

class Auth extends Equatable {
  final String accessToken;
  final String refreshToken;
  const Auth(
      {
      required this.accessToken,
      required this.refreshToken});

  @override
  List<Object?> get props =>
      [accessToken, refreshToken];

  @override
  String toString() {
    return 'Auth{accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}
