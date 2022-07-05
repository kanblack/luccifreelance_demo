import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entitis/auth.dart';
import '../error/failures.dart';

class Key {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'change_email';
  static const String paymentMethodBoxRequest = 'payment_method_box_request';
  static const String paymentMethodOverSize = 'payment_method_over_size';
}

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  Future<Either<Failure, Auth>> getAuthInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final accessToken = prefs.getString(Key.accessToken);
      final refreshToken = prefs.getString(Key.refreshToken);
      if (accessToken != null && refreshToken != null) {
        return Right(
            Auth(accessToken: accessToken, refreshToken: refreshToken));
      } else {
        return const Left(CacheFailure("Unauthorized"));
      }
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, Auth>> cacheAuthInfo(
      {required String accessToken, required String refreshToken}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(Key.accessToken, accessToken);
    await prefs.setString(Key.refreshToken, refreshToken);

    return getAuthInfo();
  }

  Future<Either<Failure, Auth>> clearAuthInfo() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(Key.accessToken);
    await prefs.remove(Key.refreshToken);

    return getAuthInfo();
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }
    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  // Future<Either<Failure, UserInfo>> getCurrentUser() async {
  //   final currentAuth = await getAuthInfo();
  //   return currentAuth.fold(
  //     (failure) => Left(failure),
  //     (auth) {
  //       final claim = parseJwt(auth.accessToken);
  //
  //       final int id = claim["sub"];
  //       final String? firstName = claim["firstName"];
  //       final String? role = claim["role"];
  //       final String? lastName = claim["lastName"];
  //       final String? email = claim["email"];
  //       final String? uuid = claim["uuid"];
  //       return Right(UserInfo(
  //         id: id,
  //         lastName: lastName ?? "",
  //         role: role ?? "",
  //         uuid: uuid ?? "",
  //         firstName: firstName ?? "",
  //         email: email ?? "",
  //       ));
  //     },
  //   );
  // }

  Future<Either<Failure, bool>> clearData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return const Right(true);
    } catch (e) {
      return Left(CacheFailure("$e"));
    }
  }
}
