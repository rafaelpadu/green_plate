import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';

class PedidoDTO {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int storeId;
  int customerId;
  List<OrderItemDTO> orderItemList;
  double itemTotal;

  PedidoDTO({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.storeId,
    required this.customerId,
    required this.orderItemList,
    required this.itemTotal,
  });
  static PedidoDTO emptyPedido() {
    return PedidoDTO(
      id: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      storeId: 0,
      customerId: 0,
      orderItemList: [],
      itemTotal: 0.0,
    );
  }

  factory PedidoDTO.fromJson(Map<String, dynamic> json) => PedidoDTO(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: json["storeId"],
        customerId: json["customerId"],
        orderItemList: List<OrderItemDTO>.from(json["orderItemList"].map((x) => OrderItemDTO.fromJson(x))),
        itemTotal: json["itemTotal"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "storeId": storeId,
        "customerId": customerId,
        "orderItemList": List<dynamic>.from(orderItemList.map((x) => x.toJson())),
        "itemTotal": itemTotal,
      };
}
