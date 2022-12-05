// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      validarIp: json['validarIp'] as bool,
      username: json['username'] as String,
      pass: json['pass'] as String,
      email: json['email'] as String,
    )
      ..id = json['id'] as int?
      ..ativo = json['ativo'] as bool
      ..dataCadastro = json['dataCadastro'] as String?;

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'ativo': instance.ativo,
      'dataCadastro': instance.dataCadastro,
      'validarIp': instance.validarIp,
      'username': instance.username,
      'pass': instance.pass,
      'email': instance.email,
    };
