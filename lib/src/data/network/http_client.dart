import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:green_plate/src/config/navigation_service.dart";
import "package:green_plate/src/data/error/exceptions.dart";
import "package:green_plate/src/presentation/features/authentication/application/login_service.dart";
import "package:http/http.dart" as http;
import "package:logger/logger.dart";
import 'package:http_interceptor/http_interceptor.dart';

class AuthorizationInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      const storage = FlutterSecureStorage();
      var token = await storage.read(key: 'token');
      String? userId = await storage.read(key: 'userId');
      String? expirationToken = await storage.read(key: 'expirationToken');
      if (expirationToken != null) {
        int expToken = int.parse(expirationToken);
        DateTime expDate = DateTime.fromMillisecondsSinceEpoch(expToken * 1000);
        if (expDate.isBefore(DateTime.now())) {
          await AuthedApiClient.refreshToken();
        }
      }
      data.headers['Authorization'] = 'Bearer $token';
      data.headers['Content-type'] = 'application/json';
      data.headers['userId'] = userId.toString();
    } catch (e) {
      logger.e(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  int get maxRetryAttempts => 3;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      await AuthedApiClient.refreshToken(); //I need to somehow pass the context to this guy here...
      return true;
    }
    return false;
  }
}

class AuthedApiClient {
  http.Client client = InterceptedClient.build(
      interceptors: [AuthorizationInterceptor()],
      requestTimeout: const Duration(seconds: 30),
      retryPolicy: ExpiredTokenRetryPolicy());

  static Future<void> refreshToken() async {
    LoginService loginService = LoginService();
    try {
      await loginService.refreshLogin();
    } catch (e) {
      if (e is RefreshTokenException) {}
      Navigator.pushReplacementNamed(NavigationService.navigatorState.currentContext!, '/');
      return;
    }
  }
}

class NoAuthApiClient {
  http.Client client =
      InterceptedClient.build(interceptors: [NoAuthInterceptor()], requestTimeout: const Duration(seconds: 60));
}

class NoAuthInterceptor implements InterceptorContract {
  Logger logger = Logger();
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(
        "Requisição do tipo: ${data.method} para: ${data.baseUrl}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
    data.headers['Content-Type'] = 'application/json';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
