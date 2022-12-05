// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'response_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseAPI {
  String mensagem;
  bool sucesso;
  dynamic objeto;
  int? statusCode;

  ResponseAPI({
    required this.mensagem,
    required this.sucesso,
    this.objeto,
    this.statusCode,
  });

  factory ResponseAPI.fromJson(Map<String, dynamic> json) =>
      _$ResponseAPIFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseAPIToJson(this);
}
