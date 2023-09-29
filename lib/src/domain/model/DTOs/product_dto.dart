class ProductDTO {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String description;
  String imageUrl;
  bool active;
  String productCategory;
  int ean13;

  ProductDTO({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.active,
    required this.productCategory,
    required this.ean13,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        active: json["active"],
        productCategory: json["productCategory"],
        ean13: json["ean13"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "active": active,
        "productCategory": productCategory,
        "ean13": ean13,
      };
}
