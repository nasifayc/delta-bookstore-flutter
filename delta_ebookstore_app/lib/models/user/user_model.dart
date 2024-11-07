import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String username;
  final String? password;
  final String email;
  final String phone;
  final bool? isAdmin;
  final List<String>? wishlistBooks;
  final List<String>? purchasedBooks;

  const UserModel({
    required this.id,
    required this.username,
    this.password,
    required this.email,
    required this.phone,
    this.isAdmin,
    this.purchasedBooks,
    this.wishlistBooks,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      isAdmin: json["isAdmin"],
      purchasedBooks: List<String>.from(json["purchasedBooks"] ?? []),
      wishlistBooks: List<String>.from(json["wishlistBooks"] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
      "isAdmin": isAdmin,
      "purchasedBooks": purchasedBooks ?? [],
      "wishlistBooks": wishlistBooks ?? [],
    };
  }

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        email,
        phone,
        isAdmin,
        purchasedBooks,
        wishlistBooks,
      ];
}
