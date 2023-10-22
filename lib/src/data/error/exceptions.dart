abstract class GreenPlateException implements Exception {
  String message;
  GreenPlateException({
    required this.message,
  });
}

class RefreshTokenException extends GreenPlateException {
  RefreshTokenException({required super.message});
}

class NotFoundException extends GreenPlateException {
  NotFoundException({required super.message});
}

class LoginException extends GreenPlateException {
  LoginException({required super.message});
}
