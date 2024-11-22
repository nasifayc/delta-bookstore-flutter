import 'dart:convert';
import 'dart:developer';

import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/models/user/user_model.dart';
import 'package:delta_ebookstore_app/services/auth/auth_service.dart';
import 'package:delta_ebookstore_app/services/manager/login_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  AuthCubit({required this.authService}) : super(AuthInitial());

  Future<void> signIn(String emailOrPhone, String password) async {
    emit(Authenticating());
    try {
      http.Response response = await authService.signin(emailOrPhone, password);
      final result = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await LoginManager.saveUserToken(result["token"]);
        emit(Authenticated(user: result["appUser"]));
      } else {
        emit(AuthFailed(errorMessage: result['error']));
      }
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  Future<void> signUpEmail(
      String name, String email, String password, String confirmPwd) async {
    log('Email Sign up: $email');
    emit(Authenticating());
    try {
      http.Response response =
          await authService.signupEmail(name, email, password, confirmPwd);
      final result = jsonDecode(response.body);
      if (response.statusCode == 201) {
        emit(OtpPending(phoneOrEmail: email, signedUpwithPhone: false));
      } else {
        emit(AuthFailed(errorMessage: result["error"]));
      }
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  Future<void> signUpPhone(
      String name, String phone, String password, String confirmPwd) async {
    log('Phone Sign up: $phone');
    emit(Authenticating());
    try {
      http.Response response =
          await authService.signupPhone(name, phone, password, confirmPwd);
      if (response.statusCode == 201) {
        emit(OtpPending(phoneOrEmail: phone, signedUpwithPhone: true));
      }
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  Future<void> verifyToken() async {
    emit(Authenticating());

    try {
      http.Response response = await authService.verifyToken();
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(Authenticated(user: UserModel.fromJson(result["user"])));
      } else {
        emit(AuthFailed(errorMessage: result["message"]));
      }
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  Future<void> validateOtp(
      String emailOrPhone, String otp, String otpType) async {
    emit(Authenticating());
    try {
      http.Response response =
          await authService.validateOtp(emailOrPhone, otp, otpType);
      final result = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await LoginManager.saveUserToken(result["token"]);
        emit(Authenticated(user: UserModel.fromJson(result["appUser"])));
      } else {
        emit(AuthFailed(errorMessage: result['error']));
      }
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }
}
