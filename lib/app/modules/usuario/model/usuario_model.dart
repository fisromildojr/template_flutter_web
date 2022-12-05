import 'package:json_annotation/json_annotation.dart';
import 'package:template_flutter_web/app/model/api/abstract_entity_model.dart';

part 'usuario_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Usuario extends AbstractEntity {
  bool validarIp;
  String username;
  String pass;
  String email;

  Usuario({
    required this.validarIp,
    required this.username,
    required this.pass,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
