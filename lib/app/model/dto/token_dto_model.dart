class TokenDTO {
  String type;
  String token;

  TokenDTO({
    required this.type,
    required this.token,
  });

  factory TokenDTO.fromJson(Map<String, dynamic> json) => TokenDTO(
        type: json['type'],
        token: json['token'],
      );
}
