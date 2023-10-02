import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';

class OrderItemDTO {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  StockDTO stockDTO;
  double itemTotal;
  double unitValue;
  double discount;
  int qtyRequested;
  int? pedidoId;

  OrderItemDTO({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.stockDTO,
    required this.itemTotal,
    required this.unitValue,
    required this.discount,
    required this.qtyRequested,
    this.pedidoId,
  });

  factory OrderItemDTO.fromJson(Map<String, dynamic> json) => OrderItemDTO(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        stockDTO: json["stockId"],
        itemTotal: json["itemTotal"].toDouble(),
        unitValue: json["unitValue"].toDouble(),
        discount: json["discount"].toDouble(),
        qtyRequested: json["qtyRequested"],
        pedidoId: json["pedidoId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "stockId": stockDTO,
        "itemTotal": itemTotal,
        "unitValue": unitValue,
        "discount": discount,
        "qtyRequested": qtyRequested,
        "pedidoId": pedidoId,
      };
}
