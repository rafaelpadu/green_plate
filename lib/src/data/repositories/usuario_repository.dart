import "package:http/http.dart" as http;
import "package:logger/logger.dart";

import "../error/exceptions.dart";
import "../network/enviroment.dart";
import "../network/http_client.dart";

class UsuarioRepository {
  Logger log = Logger();
  http.Client client = NoAuthApiClient().client;
  String apiUrl = Env.apiurl;

  Future<void> checkUserName(String userName) async {
    Uri uri = Uri.parse("$apiUrl/api/user/check-username/$userName");
    http.Response resp = await client.get(uri);
    if (resp.statusCode != 200) {
      throw UserNotFoundException(message: 'Não foi encontrado um usuário com esse e-mail');
    }
  }
}