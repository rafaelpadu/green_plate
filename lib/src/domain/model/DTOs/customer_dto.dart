import 'dart:convert';

CustomerDTO customerDtoFromJson(String str) => CustomerDTO.fromJson(json.decode(str));

String customerDtoToJson(CustomerDTO data) => json.encode(data.toJson());

class CustomerDTO {
  int id;
  String fullName;
  String phone;
  String? cpf;
  String email;

  CustomerDTO({
    required this.id,
    required this.fullName,
    required this.phone,
    this.cpf,
    required this.email,
  });

  factory CustomerDTO.fromJson(Map<String, dynamic> json) => CustomerDTO(
        id: json["id"],
        fullName: json["fullName"],
        phone: json["phone"],
        cpf: json["cpf"],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phone": phone,
        "cpf": cpf,
        "email": email,
      };
}
