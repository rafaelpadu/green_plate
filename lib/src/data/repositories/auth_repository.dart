import 'dart:convert';

import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/token_dto.dart';
import 'package:logger/logger.dart';
import "package:http/http.dart" as http;

class AuthRepository {
  Logger log = Logger();
  http.Client client = NoAuthApiClient().client;
  String apiUrl = Env.apiurl;

  Future<TokenDTO> login(UsuarioDTO usuarioDTO) async {
    Uri uri = Uri.parse('$apiUrl/auth/login');
    String body = jsonEncode(usuarioDTO.toJson());
    http.Response resp = await client.post(uri, body: body);
    Map<String, dynamic> respBody = json.decode(resp.body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw LoginException(message: respBody['message']);
    }
    return TokenDTO.fromJson(respBody['data']);
  }
}
