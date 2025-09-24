import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nro/source/mvc/view/home_view.dart';

class LoginController extends GetxController {
  // Controllers cho text field
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Key để validate form
  final formKey = GlobalKey<FormState>();

  // Trạng thái ẩn/hiện mật khẩu
  var isPasswordHidden = true.obs;

  // Hàm xử lý đăng nhập
  void login() {
    if (formKey.currentState!.validate()) {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      if (username == "1" && password == "1") {
        Get.offAll(HomeView());
      } else {
        Get.snackbar("Lỗi", "Sai tài khoản hoặc mật khẩu",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
