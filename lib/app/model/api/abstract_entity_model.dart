// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'abstract_entity_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AbstractEntity {
  int? id;
  bool ativo;
  String? dataCadastro;

  AbstractEntity({
    this.id,
    this.ativo = true,
  });

  factory AbstractEntity.fromJson(Map<String, dynamic> json) =>
      _$AbstractEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AbstractEntityToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbstractEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  String isAtivo() {
    return ativo ? "SIM" : "NÃO";
  }
}
