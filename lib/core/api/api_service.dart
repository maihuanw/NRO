import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://your-api-domain.com/api",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  // Nếu cần token -> thêm vào đây
  static void setToken(String token) {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  // GET request
  static Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // POST request
  static Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // PUT request
  static Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // Xử lý response
  static Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return {"success": true, "data": response.data};
    } else {
      return {
        "success": false,
        "statusCode": response.statusCode,
        "message": response.data?["message"] ?? "Có lỗi xảy ra"
      };
    }
  }

  // Xử lý lỗi Dio
  static Map<String, dynamic> _handleError(DioException e) {
    return {
      "success": false,
      "statusCode": e.response?.statusCode ?? 500,
      "message": e.response?.data?["message"] ?? e.message ?? "Lỗi không xác định",
    };
  }
}
