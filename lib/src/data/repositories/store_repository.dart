import 'dart:convert';

import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:green_plate/src/domain/model/DTOs/store_dto.dart';
import "package:http/http.dart" as http;
import 'package:logger/logger.dart';

class StoreRepository {
  Logger log = Logger();
  http.Client client = NoAuthApiClient().client;
  String apiUrl = Env.apiurl;

  Future<List<StoreDTO>> findAllStore() async {
    Uri uri = Uri.parse("$apiUrl/api/store/");
    http.Response resp = await client.get(uri);
    List<dynamic> respBody = json.decode(resp.body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw NotFoundException(message: 'Não foi possível buscar os items em estoque');
    }
    if (respBody.isEmpty) {
      return [];
    }
    return List.generate(respBody.length, (index) => StoreDTO.fromJson(respBody[index]));
  }
}
