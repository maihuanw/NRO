import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/getx/get_snack_bar.dart';

class ForgetPasswordController extends GetxController {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final isLoading = false.obs;
  final showOTP = false.obs;

  final _storage = GetStorage();
  final ApiService _apiService = ApiService();

  /// Bước 1: Gửi request quên mật khẩu để nhận OTP
  Future<void> forgetPassword() async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      AppSnackbar.error("Error", "Phone number is required!");
      return;
    }

    try {
      isLoading.value = true;

      final response = await _apiService.post(
        "auth/forget-password",
        data: {"phone": phone},
      );

      if (response.statusCode == 200) {
        AppSnackbar.success("Success", "OTP sent to your phone!");
        showOTP.value = true;
      } else {
        AppSnackbar.error("Error", response.data['message'] ?? "Request failed");
      }
    } catch (e) {
      AppSnackbar.error("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Bước 2: Xác thực OTP
  Future<void> getOTP() async {
    final otp = otpController.text.trim();
    final phone = phoneController.text.trim();

    if (otp.isEmpty) {
      AppSnackbar.error("Error", "OTP is required!");
      return;
    }

    try {
      isLoading.value = true;

      final response = await _apiService.post(
        "auth/verify-otp",
        data: {"phone": phone, "otp": otp},
      );

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data['token'];
        if (token != null) {
          await _storage.write("token", token);
          AppSnackbar.success("Success", "Password reset successful!");
          // Điều hướng sang login hoặc home
          // Get.offAllNamed(Routes.LOGIN);
        } else {
          AppSnackbar.info("Info", "OTP verified, please reset password.");
        }
      } else {
        AppSnackbar.error("Error", response.data['message'] ?? "OTP verification failed");
      }
    } catch (e) {
      AppSnackbar.error("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
