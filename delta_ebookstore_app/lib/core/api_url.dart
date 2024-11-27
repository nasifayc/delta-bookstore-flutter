class ApiUrl {
  static const String baseUrl = "http://192.168.0.101:4003";

  static const String signupUrl = "$baseUrl/api/auth/sign-up";
  static const String signinUrl = "$baseUrl/api/auth/sign-in";
  static const String verifyTokenUrl = "$baseUrl/api/auth/verify-token";
  static const String validateOtpUrl = "$baseUrl/api/auth/validate-otp";
  static const String changePasswordUrl = "$baseUrl/api/auth/change-my-pwd";
  static const String resetPasswordUrl = "$baseUrl/api/auth/reset-my-pwd";
  static const String updateProfileUrl = "$baseUrl/api/user/update-profile";
  static const String userProfileImageUrl =
      "$baseUrl/uploads/user-profile-photo/";
  static const String changePasswodUrl = "$baseUrl/api/auth/change-my-pwd";
}
