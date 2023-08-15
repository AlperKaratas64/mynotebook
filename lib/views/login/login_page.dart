import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mynotebook/data/src/colors.dart';
import 'package:mynotebook/data/src/images.dart';
import 'package:mynotebook/data/src/strings.dart';
import 'package:mynotebook/views/home/home_page.dart';
import 'package:mynotebook/views/login/login_controller.dart';
import 'package:mynotebook/views/register/register_page.dart';

class LoginPage extends GetWidget<LoginController> {
  static const String routeName = '/views/login/login_Page';

  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    controller.error.listen((error) => _errorDialog);
    controller.isLogin.listen((isLogin) {
      if (isLogin) _goToHomePage();
    });
    controller.errorTexts.listen((errorTexts) {
      if (errorTexts != null) _errorTextDialog(errorTexts);
    });
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                loginAppBarText,
              ),
            ],
          ),
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
            _buildImages(),
            _buildMaxSpace(),
            _buildUsernameTextField(),
            _buildPasswordTextField(),
            _buildMaxSpace(),
            _buildButton(),
            _buildSpace(),
            _buildRegistertext()
          ],
        ),
      ),
    );
  }

  Widget _buildImages() {
    return Image.asset(
      githubLogo,
      height: Get.height * .3,
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(100),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: userNameText,
          ),
          controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          controller: controller.passwordController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    const double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: () {
          if (controller.usernameController.text.isNotEmpty &&
              controller.passwordController.text.isNotEmpty) {
            controller.callingLoginService(
              controller.usernameController.text,
              controller.passwordController.text,
            );
          } else {
            _emptyDialog();
          }
        },
        child: const Text(LoginButton),
        style: ElevatedButton.styleFrom(
          primary: mainColor,
        ),
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _buildMaxSpace() {
    return const SizedBox(
      height: 40,
    );
  }

  Widget _buildRegistertext() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        const TextSpan(
          text: registerQuestionText,
          style: TextStyle(
            color: black,
          ),
        ),
        TextSpan(
            text: registerButtonText,
            style: const TextStyle(color: black, fontStyle: FontStyle.italic),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.offNamed(RegisterPage.routeName);
              }),
      ]),
    );
  }

  void _goToHomePage() {
    Get.offAndToNamed(HomePage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _errorTextDialog(String description) {
    Get.snackbar(
      errorTitle,
      description,
      colorText: white,
      backgroundColor: red,
    );
  }
}
