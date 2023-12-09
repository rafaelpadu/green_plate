// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

StoreDTO storeDtoFromJson(String str) => StoreDTO.fromJson(json.decode(str));

String storeDtoToJson(StoreDTO data) => json.encode(data.toJson());

class StoreDTO {
  int id;
  String tradeName;
  String businessName;
  String logoImgUrl;
  int? addressId;
  String storeType;
  double rating;

  StoreDTO({
    required this.id,
    required this.tradeName,
    required this.businessName,
    required this.logoImgUrl,
    this.addressId,
    required this.storeType,
    required this.rating,
  });

  factory StoreDTO.fromJson(Map<String, dynamic> json) => StoreDTO(
        id: json["id"],
        tradeName: json["tradeName"],
        businessName: json["businessName"],
        logoImgUrl: json["logoImgUrl"],
        addressId: json["addressId"],
        storeType: json["storeType"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tradeName": tradeName,
        "businessName": businessName,
        "logoImgUrl": logoImgUrl,
        "addressId": addressId,
        "rating": rating,
        "storeType": storeType
      };
}
