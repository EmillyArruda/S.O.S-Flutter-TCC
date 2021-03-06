import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/controllers/login_controller.dart';
import 'package:mobile/models/session.dart';

class UserController {
  static Future<Session> signup(String name, String number, String cpf,
      String email, String password) async {
    String url = "http://192.168.0.2:3000/signup";

    var header = {"Content-Type": "application/json"};

    var payload = json.encode({
      "email": email,
      "password": password,
      "name": name,
      "phone": number,
      "cpf": cpf,
    });

    var response = await http
        .post(url, headers: header, body: payload)
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return await LoginController.login(email, password);
    } else {
      var errorJson = json.decode(response.body);
      throw Exception(errorJson["error"]);
    }
  }
}
