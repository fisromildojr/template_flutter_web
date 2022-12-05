// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbstractEntity _$AbstractEntityFromJson(Map<String, dynamic> json) =>
    AbstractEntity(
      id: json['id'] as int?,
      ativo: json['ativo'] as bool? ?? true,
    )..dataCadastro = json['dataCadastro'] as String?;

Map<String, dynamic> _$AbstractEntityToJson(AbstractEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ativo': instance.ativo,
      'dataCadastro': instance.dataCadastro,
    };
