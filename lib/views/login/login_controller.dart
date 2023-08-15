import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mynotebook/data/services/login/login_service.dart';
import 'package:mynotebook/data/services/login/model/login_request_model.dart';
import 'package:mynotebook/data/services/login/model/login_response_model.dart';
import 'package:mynotebook/data/src/strings.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isLogin = RxBool(true);
  final RxnString errorTexts = RxnString();

  final Rxn<LoginResponseModel> user = Rxn();

  final LoginService _loginService;

  LoginController(this._loginService);

  void callingLoginService(String username, String password) {
    final LoginRequestModel reguestModel =
        LoginRequestModel(username: username, password: password);

    isLoading.call(true);
    _loginService.login(reguestModel).then((user) {
      if (user.statu == 2) isLoading.call(true);
      if (user.statu == 1) errorTexts.value = wrongPasswordText;
      if (user.statu == 0) errorTexts.value = noUserText;
      isLogin.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
