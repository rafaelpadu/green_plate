class PriceDTO {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  double unitValue;
  int stockId;

  PriceDTO({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.unitValue,
    required this.stockId,
  });

  factory PriceDTO.fromJson(Map<String, dynamic> json) => PriceDTO(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        unitValue: json["unitValue"].toDouble(),
        stockId: json["stockId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "unitValue": unitValue,
        "stockId": stockId,
      };
}
