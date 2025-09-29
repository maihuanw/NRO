import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/getx/get_snack_bar.dart';

class RegisterController extends GetxController {
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  final isLoading = false.obs;

  final _storage = GetStorage();
  final ApiService _apiService = ApiService();

  Future<void> register() async {
    final phone = phoneController.text.trim();
    final pass = passController.text.trim();
    final name = nameController.text.trim();

    if (phone.isEmpty || pass.isEmpty || name.isEmpty) {
      AppSnackbar.error("Error", "All fields are required!");
      return;
    }

    try {
      isLoading.value = true;

      final response = await _apiService.post(
        "auth/register",
        data: {
          "phone": phone,
          "password": pass,
          "name": name,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data['token'];

        if (token != null) {
          // Lưu token vào GetStorage
          await _storage.write("token", token);

          AppSnackbar.success("Success", "Register successful!");
          // Sau khi đăng ký thành công, có thể điều hướng sang Home
          // Get.offAllNamed(Routes.HOME);
        } else {
          AppSnackbar.info("Info", "Register successful, please login.");
          // Nếu API không trả token thì chỉ báo thành công
          // Get.offAll(LoginView());
        }
      } else {
        AppSnackbar.error("Error", response.data['message'] ?? "Register failed");
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
    nameController.dispose();
    super.onClose();
  }
}
