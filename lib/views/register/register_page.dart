import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotebook/data/src/colors.dart';
import 'package:mynotebook/data/src/strings.dart';
import 'package:mynotebook/views/login/login_page.dart';
import 'package:mynotebook/views/register/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  static const String routeName = '/views/register/register_page';

  @override
  Widget build(BuildContext context) {
    controller.isRegister.listen((isRegister) {
      if (isRegister) _goToLogin();
    });

    controller.error.listen((error) => _errorDialog());

    return Scaffold(
        appBar: AppBar(
          title: Text(registerAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSpace(),
            _buildUsernameTextFiled(),
            _buildSpace(),
            _buildemailTextField(),
            _buildSpace(),
            _buildBookTextFiled(),
            _buildSpace(),
            _buildPasswordTextFiled(),
            _buildSpace(),
            _buildPasswordverifyTextFiled(),
            _buildSpace(),
            _buildButon()
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextFiled() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100), topRight: Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: userNameText,
          ),
          controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _buildemailTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: emailText,
          ),
          controller: controller.emailController,
        ),
      ),
    );
  }

  Widget _buildBookTextFiled() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: BookText,
          ),
          controller: controller.bookController,
        ),
      ),
    );
  }

  Widget _buildPasswordTextFiled() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100), bottomLeft: Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          controller: controller.passwordController,
        ),
      ),
    );
  }

  Widget _buildPasswordverifyTextFiled() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100), bottomLeft: Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordVerifyText,
          ),
          controller: controller.passwordvirfyController,
        ),
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  void _onTop() {
    controller.callingRegisterService(
      controller.usernameController.text,
      controller.emailController.text,
      controller.bookController.text,
      controller.passwordController.text,
    );
  }

  Widget _buildButon() {
    const double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () => _onTop(),
        child: const Text(registerText),
        style: ElevatedButton.styleFrom(
          primary: mainColor,
        ),
      ),
    );
  }

  void _goToLogin() {
    Get.toNamed(LoginPage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }
}
