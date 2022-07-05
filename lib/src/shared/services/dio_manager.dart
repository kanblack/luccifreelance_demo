import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../env.dart';
import '../../../injection_container.dart';
import '../blocs_app/authentication/authentication.dart';
import '../constants/api_constants.dart';
import '../entitis/auth.dart';
import '../entitis/refresh_dto.dart';
import '../error/error_data.dart';
import '../error/failures.dart';
import '../network/config_network.dart';
import '../network/network_info.dart';
import 'local_store_service.dart';

class DioManager {
  final LocalStorageService localService;
  final NetworkInfo networkInfo;
  late Dio dio;

  DioManager(this.localService, this.networkInfo) {
    var options = BaseOptions(
      contentType: ConfigNetwork.contentType,
      receiveDataWhenStatusError: true,
      connectTimeout: ConfigNetwork.connectTimeout,
      receiveTimeout: ConfigNetwork.receiveTimeout,
    );
    dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (option, handler) async {
      bool isConnected = await networkInfo.isConnected;
      if (isConnected) {
        final tokens =
            (await localService.getAuthInfo()).fold((l) => null, (r) => r);
        // if (tokens != null) {
        //   if (option.path == '/auth/refresh') {
        //     option.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
        //   } else {
        //     bool hasExpired = JwtDecoder.isExpired(tokens.accessToken);
        //     if (hasExpired) {
        //       final newTokens = (await refreshToken(tokens.refreshToken))
        //           .fold((l) => null, (r) => r);
        //       if (newTokens != null) {
        //         option.headers['Authorization'] =
        //             'Bearer ${newTokens.accessToken}';
        //       }
        //     } else {
        //       option.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
        //     }
        //   }
        // }
        // TODO: Fake access token
        // option.headers['Authorization'] =
        //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiY3VzdG9tZXIiLCJmaXJzdE5hbWUiOiJIdW5nIiwibGFzdE5hbWUiOiJMZSIsImVtYWlsIjoiaGFjdGlldWhvOTZAZ21haWwuY29tIiwidXVpZCI6IjY0ZDRlNjZiLWZmMDAtNGFlMC04YTQwLTJlZTI5M2FlNDA3NyIsInN1YiI6NSwiaWF0IjoxNjQ4MDA4NDcwLCJleHAiOjE2NDgwOTQ4NzB9.eLMDcAjncLynklC_irVO5QvvnKzmGzZQdiIdKwK4Vdo';
        return handler.next(option);
      }
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (error, handler) async {
      Response? errResponse = error.response;
      // if (errResponse != null) {
      //   RequestOptions options = errResponse.requestOptions;
      //   if (errResponse.statusCode == 401) {
      //     if (checkPath(options.path)) {
      //       final token = options.headers['Authorization'];
      //       final newTokens = (
      //           await refreshToken(token)).fold((l) {
      //         getIt<AuthenticationBloc>().add(AuthenticationLogoutRequested());
      //         localService.clearAuthInfo();
      //         return;
      //       }, (r) => r);
      //       if (newTokens != null) {
      //         options.headers['Authorization'] =
      //             'Bearer ${newTokens.accessToken}';
      //         final response = (await _retry(options)).fold((l) {
      //           getIt<AuthenticationBloc>()
      //               .add(AuthenticationLogoutRequested());
      //           localService.clearAuthInfo();
      //           return;
      //         }, (r) => r);
      //         if (response != null) {
      //           return handler.resolve(response);
      //         }
      //       }
      //     }
      //   }
      //   try {
      //     String message = getMessageErrorFormErrorCode(errResponse);
      //     Response rawResponseError = Response(
      //         data: errResponse.data,
      //         requestOptions: options,
      //         statusCode: errResponse.statusCode,
      //         statusMessage: message);
      //     DioError rawError = DioError(
      //         requestOptions: options,
      //         response: rawResponseError,
      //         error: message);
      //     return handler.next(rawError);
      //   } catch (e) {
      //     return handler.next(error);
      //   }
      // }
      return handler.next(error);
    }));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        compact: true,
        logPrint: (object) {
          final formatted =
              object.toString().replaceAll("╟", "").replaceAll("║ ", "");
          print(formatted);
        }));
  }

  Future<Either<DioError?, Response<dynamic>>> _retry(
      RequestOptions requestOptions) async {
    dio.options.baseUrl = requestOptions.baseUrl;
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    try {
      final response = await dio.request<dynamic>(requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options);
      return Right(response);
    } catch (e) {
      return const Left(null);
    }
  }

  // Future<Either<Failure?, Auth>> refreshToken(String? refreshToken) async {
  //   try {
  //     final responseToken =
  //         await getIt<RestClient>().refreshToken(RefreshDTO(refreshToken!));
  //     return await localService.cacheAuthInfo(
  //         refreshToken: responseToken.refreshToken ?? "",
  //         accessToken: responseToken.accessToken ?? "");
  //   } catch (e) {
  //     getIt<AuthenticationBloc>().add(AuthenticationLogoutRequested());
  //     localService.clearAuthInfo();
  //     return const Left(null);
  //   }
  // }

  String getMessageErrorFormErrorCode(Response errResponse) {
    try {
      var dataFormatted = errResponse.data;
      if (dataFormatted is String) {
        dataFormatted = json.decode(dataFormatted.trim());
      }
      String code = dataFormatted['code'];
      String extraErr = dataFormatted['extra'].toString();
      if (errorData.containsKey(code)) {
        if (BASE_URL == BaseUrl.dev) {
          return errorData[code] + "\n" + extraErr;
        }
        return errorData[code];
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }
  // String getMessageErrorFormErrorCode(Response errResponse) {
  //   var dataFormatted = errResponse.data;
  //   if (dataFormatted is String) {
  //     dataFormatted = json.decode(dataFormatted.trim());
  //   }
  //   String message = dataFormatted['message'];
  //   return message;
  // }

  bool checkPath(String path) {
    if (path != "/auth/login/email" &&
        path != "/auth/login/google" &&
        path != "/auth/login/facebook" &&
        path != "/auth/refresh") {
      return true;
    } else {
      return false;
    }
  }
}
