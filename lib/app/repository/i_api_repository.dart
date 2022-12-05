import 'package:template_flutter_web/app/model/api/abstract_entity_model.dart';
import 'package:template_flutter_web/app/model/api/response_api_model.dart';

abstract class IAPIRepository<T extends AbstractEntity> {
  void verificaLogin();
  Future<ResponseAPI> findAll(String url);
  Future<ResponseAPI> findById(String url, AbstractEntity data);
  Future<ResponseAPI> save(String url, AbstractEntity data);
  Future<ResponseAPI> update(String url, AbstractEntity data);
  Future<ResponseAPI> delete(String url, AbstractEntity data);
}
