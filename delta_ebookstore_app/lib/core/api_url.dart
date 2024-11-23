class ApiUrl {
  static const String baseUrl = "http://192.168.0.110:4003/api";

  static const String signupUrl = "$baseUrl/auth/sign-up";
  static const String signinUrl = "$baseUrl/auth/sign-in";
  static const String verifyTokenUrl = "$baseUrl/auth/verify-token";
  static const String validateOtpUrl = "$baseUrl/auth/validate-otp";
  static const String changePasswordUrl = "$baseUrl/auth/change-my-pwd";
  static const String resetPasswordUrl = "$baseUrl/auth/reset-my-pwd";
}
