import 'dart:convert';

RegisterResponsemodel registerResponsemodelFromJson(String str) =>
    RegisterResponsemodel.fromJson(json.decode(str));

class RegisterResponsemodel {
  final bool statu;
  final String message;

  RegisterResponsemodel.fromJson(Map<String, dynamic> json)
      : statu = json["STATU"],
        message = json["MESSAGE"];
}
