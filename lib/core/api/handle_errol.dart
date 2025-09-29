import 'package:dio/dio.dart';

class ErrorHandler {
  /// Xử lý lỗi chung từ Dio
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Kết nối quá thời gian, vui lòng thử lại.";
        case DioExceptionType.sendTimeout:
          return "Gửi dữ liệu quá lâu, vui lòng thử lại.";
        case DioExceptionType.receiveTimeout:
          return "Máy chủ phản hồi quá lâu, vui lòng thử lại.";
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return "Yêu cầu đã bị hủy.";
        case DioExceptionType.unknown:
          return "Không có kết nối mạng hoặc lỗi không xác định.";
        default:
          return "Đã xảy ra lỗi không xác định.";
      }
    } else {
      return "Đã xảy ra lỗi: ${error.toString()}";
    }
  }

  /// Xử lý lỗi từ response API
  static String _handleBadResponse(Response? response) {
    if (response == null) return "Không nhận được phản hồi từ máy chủ.";

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    if (data is Map && data.containsKey("message")) {
      return data["message"];
    }

    switch (statusCode) {
      case 400:
        return "Yêu cầu không hợp lệ.";
      case 401:
        return "Bạn chưa đăng nhập hoặc phiên đã hết hạn.";
      case 403:
        return "Bạn không có quyền thực hiện hành động này.";
      case 404:
        return "Không tìm thấy dữ liệu.";
      case 500:
        return "Lỗi máy chủ, vui lòng thử lại sau.";
      default:
        return "Lỗi không xác định (mã $statusCode).";
    }
  }
}
