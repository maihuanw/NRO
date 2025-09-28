class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = "https://api.example.com";
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static const String logout = "$baseUrl/auth/logout";
  static const String userProfile = "$baseUrl/user/profile";
  static const String updateUser = "$baseUrl/user/update";
  static const String products = "$baseUrl/products";
  static const String orders = "$baseUrl/orders";
}
