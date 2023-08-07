import 'dart:convert';

String registerRequestmodelToJson(RegisterRequestmodel data) =>
    json.encode(data.toJson());

class RegisterRequestmodel {
  final String username;
  final String email;
  final String book;
  final String password;

  RegisterRequestmodel({
    required this.username,
    required this.email,
    required this.book,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "book": book,
        "password": password
      };
}
