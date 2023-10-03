import 'package:green_plate/src/domain/model/DTOs/price_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/product_dto.dart';

class StockDTO {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int storeId;
  String storeTradeName;
  ProductDTO productDTO;
  int currentQty;
  int minimalQty;
  int maxQty;
  String dueDate;
  List<PriceDTO> priceList;

  StockDTO({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.storeId,
    required this.storeTradeName,
    required this.productDTO,
    required this.currentQty,
    required this.minimalQty,
    required this.maxQty,
    required this.dueDate,
    required this.priceList,
  });

  factory StockDTO.fromJson(Map<String, dynamic> json) => StockDTO(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: json["storeId"],
        storeTradeName: json["storeTradeName"],
        productDTO: ProductDTO.fromJson(json["productDTO"]),
        currentQty: json["currentQty"],
        minimalQty: json["minimalQty"],
        maxQty: json["maxQty"],
        dueDate: json["dueDate"],
        priceList: List<PriceDTO>.from(json["priceList"].map((x) => PriceDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "storeId": storeId,
        "storeTradeName": storeTradeName,
        "productDTO": productDTO.toJson(),
        "currentQty": currentQty,
        "minimalQty": minimalQty,
        "maxQty": maxQty,
        "dueDate": dueDate,
        "priceList": List<dynamic>.from(priceList.map((x) => x.toJson())),
      };
}
