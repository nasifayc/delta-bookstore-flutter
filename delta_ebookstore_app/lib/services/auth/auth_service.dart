import 'dart:convert';

import 'package:delta_ebookstore_app/core/api_url.dart';
import 'package:delta_ebookstore_app/services/manager/login_manager.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<http.Response> signupEmail(
      String name, String? email, String password, String confirmPwd) async {
    final requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "confirmPwd": confirmPwd,
      "registerByPhone": false
    };
    final response = await http.post(Uri.parse(ApiUrl.signupUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody));

    return response;
  }

  Future<http.Response> signupPhone(
      String name, String? phone, String password, String confirmPwd) async {
    final requestBody = {
      "name": name,
      "phone": phone,
      "password": password,
      "confirmPwd": confirmPwd,
      "registerByPhone": true
    };
    final response = await http.post(Uri.parse(ApiUrl.signupUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody));

    return response;
  }

  Future<http.Response> signin(String emailOrPhone, String password) async {
    final response = await http.post(Uri.parse(ApiUrl.signinUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'emailOrPhone': emailOrPhone, 'password': password}));

    return response;
  }

  Future<http.Response> verifyToken() async {
    String? token = await LoginManager.getUserToken();
    final response = await http
        .get(Uri.parse(ApiUrl.verifyTokenUrl), headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  Future<http.Response> validateOtp(
      String emailOrPhone, String otp, String otpType) async {
    final response = await http.post(Uri.parse(ApiUrl.validateOtpUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {'emailOrPhone': emailOrPhone, 'otp': otp, 'otpType': otpType}));
    return response;
  }
}