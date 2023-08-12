import 'package:mynotebook/data/services/login/model/login_request_model.dart';
import 'package:mynotebook/data/services/login/model/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginService {
  Future login(LoginRequestModel loginRequestModel);
}

class LoginServiceImp extends LoginService {
  @override
  Future login(LoginRequestModel loginRequestModel) async {
    const String _baseUrl = 'http://tozlukitabım.com/notebook/login.php';

    var _url = Uri.parse(Uri.encodeQueryComponent(_baseUrl));

    final response = await http.post(_url, body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      print('Giriş başarılı');
      print(response.body);
      return loginResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}
