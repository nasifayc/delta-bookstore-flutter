import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? password;
  final String? profilePicture;
  final String? username;

  const UserModel({
    required this.id,
    required this.name,
    this.password,
    required this.email,
    required this.phone,
    this.profilePicture,
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      profilePicture: json["profilePicture"],
      username: json["username"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
      "profilePicture": profilePicture,
      "username": username,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        password,
        email,
        phone,
        profilePicture,
        username,
      ];
}
