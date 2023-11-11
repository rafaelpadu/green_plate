import "dart:convert";

import "package:green_plate/src/domain/model/DTOs/change_password_dto.dart";
import "package:green_plate/src/domain/model/DTOs/usuario_dto.dart";
import "package:http/http.dart" as http;
import "package:logger/logger.dart";

import "../error/exceptions.dart";
import "../network/enviroment.dart";
import "../network/http_client.dart";

class UsuarioRepository {
  Logger log = Logger();
  http.Client client = NoAuthApiClient().client;
  String apiUrl = Env.apiurl;

  Future<UsuarioDTO> checkUserName(String userName) async {
    Uri uri = Uri.parse("$apiUrl/api/user/check-username/$userName");
    http.Response resp = await client.get(uri);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw UserNotFoundException(message: 'Não foi encontrado um usuário com esse e-mail');
    }
    dynamic respBody = json.decode(resp.body);
    return UsuarioDTO.fromJson(respBody);
  }

  Future<void> resetNewPassword(ChangePasswordDTO changePasswordDto) async {
    Uri uri = Uri.parse("$apiUrl/api/user/reset-password");
    final body = jsonEncode(changePasswordDto.toJson());
    http.Response resp = await client.put(uri, body: body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw UserNotFoundException(message: 'Não foi possível alterar a senha de cadastro');
    }
  }

  Future<void> createNewUsuario(UsuarioDTO usuarioDTO) async {
    Uri uri = Uri.parse("$apiUrl/api/user");
    final body = jsonEncode(usuarioDTO.toJson());
    http.Response resp = await client.post(uri, body: body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw UserNotFoundException(message: 'Não foi possível cadastrar a sua conta. Tente novamente mais tarde');
    }
  }
}
