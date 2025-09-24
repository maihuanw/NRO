import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  void submit() {
    if (formKey.currentState!.validate()) {
      final phone = phoneController.text.trim();

      // TODO: Thay bằng logic gọi API gửi OTP hoặc link reset
      Get.snackbar(
        "Thành công",
        "Đã gửi hướng dẫn khôi phục tới số $phone",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
