import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:logger/logger.dart';
import "package:http/http.dart" as http;

class HomeRepository {
  Logger log = Logger();
  http.Client client = NoAuthApiClient().client;
  String apiUrl = Env.apiurl;
}
