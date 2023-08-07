import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mynotebook/data/services/register/model/register_request_model.dart';
import 'package:mynotebook/data/services/register/model/register_resporise_model.dart';
import 'package:mynotebook/data/services/register/register_service.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bookController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordvirfyController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rx<dynamic> error = Rxn<dynamic>();
  final RxBool isRegister = RxBool(false);

  final Rxn<RegisterResponsemodel> user = Rxn();

  final RegisterService _registerService;

  RegisterController(this._registerService);

  void callingRegisterService(
      String username, String email, String book, String password) {
    final RegisterRequestmodel _userRequest = RegisterRequestmodel(
        username: username, email: email, book: book, password: password);

    isLoading.call(true);
    _registerService.register(_userRequest).then((user) {
      isRegister.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
