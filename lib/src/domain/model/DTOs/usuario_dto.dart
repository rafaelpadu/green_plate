class UsuarioDTO {
  int id;
  String userName;
  String email;
  String password;
  int customerId;
  bool active;

  UsuarioDTO({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.customerId,
    required this.active,
  });

  static UsuarioDTO emptyUsuario() {
    return UsuarioDTO(
      id: 0,
      userName: '',
      email: '',
      password: '',
      customerId: 0,
      active: true,
    );
  }

  static UsuarioDTO loginUsuario(String userName, String password) {
    return UsuarioDTO(
      id: 0,
      userName: userName,
      email: userName,
      password: password,
      customerId: 0,
      active: true,
    );
  }

  factory UsuarioDTO.fromJson(Map<String, dynamic> json) => UsuarioDTO(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        customerId: json["customerId"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "email": email,
        "password": password,
        "customerId": customerId,
        "active": active,
      };
}
