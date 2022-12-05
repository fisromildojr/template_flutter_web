// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAPI _$ResponseAPIFromJson(Map<String, dynamic> json) => ResponseAPI(
      mensagem: json['mensagem'] as String,
      sucesso: json['sucesso'] as bool,
      objeto: json['objeto'],
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$ResponseAPIToJson(ResponseAPI instance) =>
    <String, dynamic>{
      'mensagem': instance.mensagem,
      'sucesso': instance.sucesso,
      'objeto': instance.objeto,
      'statusCode': instance.statusCode,
    };
