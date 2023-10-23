class TokenDTO {
  String token;
  String refreshToken;
  TokenDTO({
    required this.token,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  factory TokenDTO.fromJson(Map<String, dynamic> map) {
    return TokenDTO(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }
}
