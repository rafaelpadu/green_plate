import 'dart:convert';

import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:green_plate/src/domain/model/DTOs/customer_dto.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CustomerRepository {
  Logger log = Logger();
  http.Client client = AuthedApiClient().client;
  String apiUrl = Env.apiurl;

  Future<CustomerDTO> getCustomerByUserId() async {
    Uri uri = Uri.parse("$apiUrl/api/customer/secure/find-by-user-id");
    http.Response resp = await client.get(uri);
    if (resp.statusCode != 200) {
      throw CustomerNotFoundException(message: 'Cliente não encontrado');
    }
    dynamic respBody = json.decode(resp.body);
    return CustomerDTO.fromJson(respBody);
  }

  Future<CustomerDTO> updateCustomer(CustomerDTO customerDTO) async {
    Uri uri = Uri.parse("$apiUrl/api/customer/secure/update");
    String body = jsonEncode(customerDTO.toJson());
    http.Response resp = await client.put(uri, body: body);
    if (resp.statusCode != 202) {
      throw CustomerNotFoundException(message: 'Não foi possivel atualizar o cadastro');
    }
    dynamic respBody = json.decode(resp.body);
    return CustomerDTO.fromJson(respBody);
  }
}
