import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/getx/get_snack_bar.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  final isLoading = false.obs;

  final _storage = GetStorage();
  final ApiService _apiService = ApiService();

  Future<void> login() async {
    final phone = phoneController.text.trim();
    final pass = passController.text.trim();

    if (phone.isEmpty || pass.isEmpty) {
      AppSnackbar.error("Error", "Phone and password are required!");
      return;
    }

    try {
      isLoading.value = true;

      final response = await _apiService.post(
        "auth/login", // endpoint của bạn (tương ứng với ApiService baseUrl)
        data: {
          "phone": phone,
          "password": pass,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data['token'];

        if (token != null) {
          // Lưu token vào GetStorage
          await _storage.write("token", token);

          AppSnackbar.success("Success", "Login successful!");
          // Điều hướng sang Home chẳng hạn
          // Get.offAllNamed(Routes.HOME);
        } else {
          AppSnackbar.error("Error", "Token not found in response");
        }
      } else {
        AppSnackbar.error("Error", response.data['message'] ?? "Login failed");
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
    passController.dispose();
    super.onClose();
  }
}
