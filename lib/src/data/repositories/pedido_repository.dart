import 'package:green_plate/src/data/network/enviroment.dart';
import 'package:green_plate/src/data/network/http_client.dart';
import 'package:logger/logger.dart';

class PedidoRepository {
  Logger log = Logger();
  String apiUrl = Env.apiurl;
}
