import 'dart:convert';

import 'dart:io';

import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/user/user_state.dart';
import 'package:delta_ebookstore_app/models/user/user_model.dart';
import 'package:delta_ebookstore_app/services/user/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UserCubit extends Cubit<UserState> {
  final UserService userService;
  final AuthCubit authCubit;
  UserCubit({required this.userService, required this.authCubit})
      : super(UserInitial());

  Future<void> updateProfile(
      File? profileImage, String? username, String? name) async {
    emit(UpdatingProfile());
    try {
      http.StreamedResponse response = await userService.updateProfile(
        profileImage,
        username,
        name,
      );

      final result = await jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        authCubit.updateUserState(UserModel.fromJson(result['user']));
        emit(UserProfileUpdatedSucceeded());
        // emit(UserProfileUpdated(user: UserModel.fromJson(result['user'])));
      } else {
        emit(UserProfileUpdatedFailed(error: result['error']));
      }
    } catch (e) {
      emit(UserProfileUpdatedFailed(error: e.toString()));
    }
  }
}
