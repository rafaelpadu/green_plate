import 'dart:convert';

import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:green_plate/src/domain/model/DTOs/pedido_dto.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class PedidoRepository {
  Logger log = Logger();
  String apiUrl = Env.apiurl;
  http.Client client = AuthedApiClient().client;

  Future<void> createNewPedido(PedidoDTO pedido, int userId) async {
    Uri uri = Uri.parse("$apiUrl/api/pedido/new-pedido/$userId");
    final body = jsonEncode(pedido.toJson());
    log.i(body);
    http.Response resp = await client.post(uri, body: body);
    log.i(resp.request);
    if (resp.statusCode != 201) {
      throw PedidoException(message: 'Não foi possível criar um novo pedido');
    }
  }
}
