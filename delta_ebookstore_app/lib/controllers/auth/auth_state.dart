import 'package:delta_ebookstore_app/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AppStarted extends AuthState {}

final class OtpPending extends AuthState {
  final String phoneOrEmail;
  final bool signedUpwithPhone;

  OtpPending({required this.phoneOrEmail, required this.signedUpwithPhone});

  @override
  List<Object> get props => [phoneOrEmail];
}

final class Authenticating extends AuthState {}

final class Authenticated extends AuthState {
  final UserModel user;
  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthFailed extends AuthState {
  final String errorMessage;
  AuthFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
