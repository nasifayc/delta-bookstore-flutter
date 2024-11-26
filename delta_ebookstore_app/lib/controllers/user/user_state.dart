import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

final class UpdatingProfile extends UserState {}

final class ChangingPassword extends UserState {}

final class PasswordChangedSuccess extends UserState {}

final class PasswordChangedFailure extends UserState {
  final String error;

  PasswordChangedFailure({required this.error});
  @override
  List<Object?> get props => [error];
}

final class UserProfileUpdatedSucceeded extends UserState {
  final String successMessage = "User profile updated successfully";
}

// final class UserProfileUpdated extends UserState {
//   final UserModel user;

//   UserProfileUpdated({required this.user});
//   @override
//   List<Object?> get props => [user];
// }

final class UserProfileUpdatedFailed extends UserState {
  final String error;

  UserProfileUpdatedFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
