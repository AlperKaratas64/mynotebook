import 'package:dio/dio.dart';
import 'package:mynotebook/data/services/dio_manager.dart';
import 'package:mynotebook/data/services/register/model/register_request_model.dart';
import 'package:mynotebook/data/services/register/model/register_resporise_model.dart';

abstract class RegisterService {
  Future<RegisterResponsemodel> register(
      RegisterRequestmodel registerRequestmodel);
}

class RegisterServiceImp extends RegisterService {
  final Dio _dio;
  RegisterServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future<RegisterResponsemodel> register(
      RegisterRequestmodel registerRequestmodel) {
    return _dio
        .post(
          "notebook/register.php",
          data: registerRequestmodel.toJson(),
        )
        .then(
          (Response) => registerResponsemodelFromJson(Response.data),
        );
  }
}
