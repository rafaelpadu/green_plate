import 'dart:convert';

import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:green_plate/src/domain/enum/product_category.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';
import 'package:green_plate/src/utils/page_filter.dart';
import 'package:logger/logger.dart';
import "package:http/http.dart" as http;

class StockRepository {
  Logger log = Logger();
  http.Client client = NoAuthApiClient().client;
  String apiUrl = Env.apiurl;

  Future<List<StockDTO>> findAvailableStockItems() async {
    Uri uri = Uri.parse("$apiUrl/api/stock/");
    http.Response resp = await client.get(uri);
    List<dynamic> respBody = json.decode(resp.body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw NotFoundException(message: 'Não foi possível buscar os items em estoque');
    }
    if (respBody.isEmpty) {
      return [];
    }
    return List.generate(respBody.length, (index) => StockDTO.fromJson(respBody[index]));
  }

  Future<List<StockDTO>> findAvailableStockItemsByProductCategory(ProductCategory productCategory) async {
    Uri uri = Uri.parse("$apiUrl/api/stock/find-by-product-category/${productCategory.toJson()}");
    http.Response resp = await client.get(uri);
    List<dynamic> respBody = json.decode(resp.body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw NotFoundException(message: 'Não foi possível buscar os items em estoque');
    }
    if (respBody.isEmpty) {
      return [];
    }
    return List.generate(respBody.length, (index) => StockDTO.fromJson(respBody[index]));
  }

  Future<StockDTO> findStockByStockID(int stockId) async {
    Uri uri = Uri.parse("$apiUrl/api/stock/$stockId");
    http.Response resp = await client.get(uri);
    dynamic respBody = json.decode(resp.body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw NotFoundException(message: 'Não foi possível buscar os items em estoque');
    }
    return StockDTO.fromJson(respBody);
  }

  Future<List<StockDTO>> findStockByProductNameOrStoreTradeName(PageFilter page) async {
    Uri uri = Uri.parse("$apiUrl/api/stock/search-anything");
    final body = page.toJson();
    http.Response resp = await client.post(uri, body: body);
    List<dynamic> respBody = json.decode(resp.body);
    log.i(resp.request);
    if (resp.statusCode != 200) {
      throw NotFoundException(message: 'Não foi possível buscar os items em estoque');
    }
    if (respBody.isEmpty) {
      return [];
    }
    return List.generate(respBody.length, (index) => StockDTO.fromJson(respBody[index]));
  }
}
