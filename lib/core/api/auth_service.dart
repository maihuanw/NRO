import 'api_service.dart';

class AuthService {
  /// Đăng nhập
  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    return await ApiService.post(
      "/auth/login",
      data: {
        "username": username,
        "password": password,
      },
    );
  }

  /// Đăng ký
  static Future<Map<String, dynamic>> register({
    required String username,
    required String phone,
    required String password,
  }) async {
    return await ApiService.post(
      "/auth/register",
      data: {
        "username": username,
        "phone": phone,
        "password": password,
      },
    );
  }

  /// Quên mật khẩu
  static Future<Map<String, dynamic>> forgotPassword({
    required String phone,
  }) async {
    return await ApiService.post(
      "/auth/forgot-password",
      data: {
        "phone": phone,
      },
    );
  }
}
