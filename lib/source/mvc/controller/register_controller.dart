import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void register() {
    if (formKey.currentState!.validate()) {
      final username = usernameController.text.trim();
      final phone = phoneController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        Get.snackbar(
          "Lỗi",
          "Mật khẩu xác nhận không khớp",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // TODO: gọi API hoặc xử lý logic đăng ký
      Get.snackbar(
        "Thành công",
        "Tạo tài khoản cho $username thành công!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
