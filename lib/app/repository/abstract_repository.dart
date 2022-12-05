import 'package:template_flutter_web/app/exceptions/api_exception.dart';
import 'package:template_flutter_web/app/exceptions/connection_exception.dart';
import 'package:template_flutter_web/app/exceptions/login_exception.dart';
import 'package:template_flutter_web/app/model/api/abstract_entity_model.dart';
import 'package:template_flutter_web/app/model/api/response_api_model.dart';
import 'package:template_flutter_web/app/repository/i_api_repository.dart';
import 'package:template_flutter_web/app/storage/web-storage.dart';
import 'package:template_flutter_web/app/utils/rest_client.dart';
import 'package:template_flutter_web/app/utils/routes/back_routes.dart';

abstract class AbstractRepository implements IAPIRepository {
  final RestClient rest;

  AbstractRepository(this.rest);

  void verificaLogin() {
    if (WebStorage.instance.token == null) {
      throw LoginException("Realize o login para executar essa ação");
    }
  }

  @override
  Future<ResponseAPI> findAll(String url) async {
    verificaLogin();
    final response = await rest.get(
      BackRoutes.baseUrl + url,
      headers: {
        "Authorization": "Bearer ${WebStorage.instance.token!}",
      },
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
      }
      if (response.statusCode == 403) {
        throw LoginException("Realize login para executar essa ação");
      }
    }
    // Retorna a mensagem que o back enviou
    if (response.body['sucesso'] == false) {
      if (response.body['mensagem'].toString().contains('Usuário')) {
        throw LoginException(response.body['mensagem']);
      }
      throw APIException(response.body['mensagem']);
    }

    return ResponseAPI.fromJson(response.body);
  }

  @override
  Future<ResponseAPI> delete(String url, AbstractEntity data) async {
    verificaLogin();
    final response = await rest.post(
      BackRoutes.baseUrl + url,
      data.toJson(),
      headers: {
        "Authorization": "Bearer ${WebStorage.instance.token!}",
      },
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
      }
      if (response.statusCode == 403) {
        throw LoginException("Realize login para executar essa ação");
      }
    }
    // Retorna a mensagem que o back enviou
    if (response.body['sucesso'] == false) {
      if (response.body['mensagem'].toString().contains('Usuário')) {
        throw LoginException(response.body['mensagem']);
      }
      throw APIException(response.body['mensagem']);
    }

    return ResponseAPI.fromJson(response.body);
  }

  @override
  Future<ResponseAPI> findAllByToken(String url) async {
    verificaLogin();
    final response = await rest.get(
      BackRoutes.baseUrl + url,
      headers: {
        "Authorization": "Bearer ${WebStorage.instance.token!}",
      },
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
      }
      if (response.statusCode == 403) {
        throw LoginException("Realize login para executar essa ação");
      }
    }
    // Retorna a mensagem que o back enviou
    if (response.body['sucesso'] == false) {
      if (response.body['mensagem'].toString().contains('Usuário')) {
        throw LoginException(response.body['mensagem']);
      }
      throw APIException(response.body['mensagem']);
    }

    return ResponseAPI.fromJson(response.body);
  }

  @override
  Future<ResponseAPI> findById(String url, AbstractEntity data) async {
    verificaLogin();
    final response = await rest.post(
      BackRoutes.baseUrl + url,
      data.toJson(),
      headers: {
        "Authorization": "Bearer ${WebStorage.instance.token!}",
      },
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
      }
      if (response.statusCode == 403) {
        throw LoginException("Realize login para executar essa ação");
      }
    }
    // Retorna a mensagem que o back enviou
    if (response.body['sucesso'] == false) {
      if (response.body['mensagem'].toString().contains('Usuário')) {
        throw LoginException(response.body['mensagem']);
      }
      throw APIException(response.body['mensagem']);
    }

    return ResponseAPI.fromJson(response.body);
  }

  @override
  Future<ResponseAPI> save(String url, AbstractEntity data) async {
    verificaLogin();
    final response = await rest.post(
      BackRoutes.baseUrl + url,
      data.toJson(),
      headers: {
        "Authorization": "Bearer ${WebStorage.instance.token!}",
      },
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
      }
      if (response.statusCode == 403) {
        throw LoginException("Realize login para executar essa ação");
      }
    }
    // Retorna a mensagem que o back enviou
    if (response.body['sucesso'] == false) {
      if (response.body['mensagem'].toString().contains('Usuário')) {
        throw LoginException(response.body['mensagem']);
      }
      throw APIException(response.body['mensagem']);
    }

    return ResponseAPI.fromJson(response.body);
  }

  @override
  Future<ResponseAPI> update(String url, AbstractEntity data) async {
    verificaLogin();
    final response = await rest.post(
      BackRoutes.baseUrl + url,
      data.toJson(),
      headers: {
        "Authorization": "Bearer ${WebStorage.instance.token!}",
      },
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
      }
      if (response.statusCode == 403) {
        throw LoginException("Realize login para executar essa ação");
      }
    }
    // Retorna a mensagem que o back enviou
    if (response.body['sucesso'] == false) {
      if (response.body['mensagem'].toString().contains('Usuário')) {
        throw LoginException(response.body['mensagem']);
      }
      throw APIException(response.body['mensagem']);
    }

    return ResponseAPI.fromJson(response.body);
  }
}
