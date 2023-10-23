import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_plate/src/data/repositories/auth_repository.dart';
import 'package:green_plate/src/data/repositories/usuario_repository.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/presentation/features/authentication/application/token_dto.dart';
import 'package:green_plate/src/utils/jwt_decode.dart';

class LoginService {
  AuthRepository authRepository = AuthRepository();
  final storage = const FlutterSecureStorage();
  refreshLogin() {}
  Future<void> login(String userName, String password) async {
    UsuarioDTO usuarioDTO = UsuarioDTO.loginUsuario(userName, password);
    TokenDTO token = await authRepository.login(usuarioDTO);
    Map<String, dynamic> tokenDecoded = parseJwtPayLoad(token.token);
    await saveUserInfoToStorage(token.token, token.refreshToken, tokenDecoded['userId']);
  }

  Future<void> saveUserInfoToStorage(String token, String refreshToken, int userId) async {
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'refreshToken', value: refreshToken);
    await storage.write(key: 'userId', value: userId.toString());
  }

  Future<UsuarioDTO> checkIfUserNameExists(String userName) {
    UsuarioRepository usuarioRepository = UsuarioRepository();
    return usuarioRepository.checkUserName(userName);
  }
}
