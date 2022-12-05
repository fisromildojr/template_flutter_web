import 'package:template_flutter_web/app/exceptions/api_exception.dart';
import 'package:template_flutter_web/app/exceptions/connection_exception.dart';
import 'package:template_flutter_web/app/exceptions/login_exception.dart';
import 'package:template_flutter_web/app/model/api/response_api_model.dart';
import 'package:template_flutter_web/app/model/dto/login_dto_model.dart';
import 'package:template_flutter_web/app/repository/abstract_repository.dart';
import 'package:template_flutter_web/app/storage/web-storage.dart';
import 'package:template_flutter_web/app/utils/rest_client.dart';
import 'package:template_flutter_web/app/utils/routes/back_routes.dart';

class UsuarioRepository extends AbstractRepository {
  UsuarioRepository(RestClient rest) : super(rest);

  Future<ResponseAPI> login(String url, LoginDTO data) async {
    final response = await rest.post(
      BackRoutes.baseUrl + url,
      data.toJson(),
    );

    if (response.hasError) {
      if (response.statusText == "XMLHttpRequest error." ||
          response.body == null) {
        throw ConnectionException(
            'Servidor indisponível no momento, tente novamente mais tarde');
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

  Future<ResponseAPI> logout() async {
    super.verificaLogin();
    final response = await rest.post(
      BackRoutes.baseUrl + BackRoutes.LOGOUT,
      null,
      headers: {
        "Authorization": "Bearer " + WebStorage.instance.token!,
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

  Future<ResponseAPI> me() async {
    super.verificaLogin();
    final response = await rest.get(
      BackRoutes.baseUrl + BackRoutes.ME,
      headers: {
        "Authorization": "Bearer " + WebStorage.instance.token!,
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
