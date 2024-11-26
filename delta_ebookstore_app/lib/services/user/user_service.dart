import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:delta_ebookstore_app/core/api_url.dart';
import 'package:delta_ebookstore_app/services/manager/login_manager.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<http.StreamedResponse> updateProfile(
      File? profileImage, String? username, String? name) async {
    String? token = await LoginManager.getUserToken();
    final request =
        http.MultipartRequest('POST', Uri.parse(ApiUrl.updateProfileUrl))
          ..headers['Authorization'] = 'Bearer $token'
          ..fields['name'] = name ?? ''
          ..fields['username'] = username ?? '';

    if (profileImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
            'user-profile-photo', profileImage.path),
      );
    }

    final response = await request.send();

    return response;
  }

  Future<http.Response> changePassword(
      String prevPwd, String newPwd, String confirmPwd) async {
    log('$prevPwd $newPwd $confirmPwd');
    String? token = await LoginManager.getUserToken();
    Map<String, dynamic> requestBody = {
      "prevPwd": prevPwd,
      "newPwd": newPwd,
      "confirmPwd": confirmPwd
    };
    final response = await http.post(Uri.parse(ApiUrl.changePasswodUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody));

    return response;
  }
}
