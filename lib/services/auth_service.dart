// ignore_for_file: avoid_print

import 'package:btbpp/services/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  static Future<http.Response> register(
      String name, String numberphone, String email, String password) async {
    Map data = {
      "name": name,
      "numberphone": numberphone,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

    static Future<http.Response> login(
      String numberphone, String password) async {
    Map data = {
      "numberphone": numberphone,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
