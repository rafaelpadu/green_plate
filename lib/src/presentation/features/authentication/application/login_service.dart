import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_plate/src/data/repositories/auth_repository.dart';
import 'package:green_plate/src/data/repositories/usuario_repository.dart';
import 'package:green_plate/src/domain/model/DTOs/change_password_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/token_dto.dart';
import 'package:green_plate/src/utils/jwt_decode.dart';

class LoginService {
  AuthRepository authRepository = AuthRepository();
  UsuarioRepository usuarioRepository = UsuarioRepository();
  final storage = const FlutterSecureStorage();
  Future<bool> refreshLogin() async {
    String? refreshToken = await storage.read(key: 'refreshToken');
    if (refreshToken != null) {
      TokenDTO token = await authRepository.refreshLogin(refreshToken);
      Map<String, dynamic> tokenDecoded = parseJwtPayLoad(token.token);
      await saveUserInfoToStorage(token.token, token.refreshToken, tokenDecoded['userId'], tokenDecoded['exp']);
      return true;
    }
    return false;
  }

  Future<void> login(String userName, String password) async {
    UsuarioDTO usuarioDTO = UsuarioDTO.loginUsuario(userName, password);
    TokenDTO token = await authRepository.login(usuarioDTO);
    Map<String, dynamic> tokenDecoded = parseJwtPayLoad(token.token);
    await saveUserInfoToStorage(token.token, token.refreshToken, tokenDecoded['userId'], tokenDecoded['exp']);
  }

  Future<void> saveUserInfoToStorage(String token, String refreshToken, int userId, int expirationToken) async {
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'refreshToken', value: refreshToken);
    await storage.write(key: 'userId', value: userId.toString());
    await storage.write(key: 'expirationToken', value: expirationToken.toString());
  }

  Future<UsuarioDTO> checkIfUserNameExists(String userName) {
    return usuarioRepository.checkUserName(userName);
  }

  Future<void> createNewPassWord(int userId, String password) {
    ChangePasswordDTO changePasswordDto = ChangePasswordDTO(userId: userId, oldPassword: '', newPassword: password);
    return usuarioRepository.resetNewPassword(changePasswordDto);
  }

  Future<void> createNewUsuario(UsuarioDTO usuarioDTO) async {
    return await usuarioRepository.createNewUsuario(usuarioDTO);
  }
}
