import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  /// Hiển thị thông báo thành công
  static void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  /// Hiển thị thông báo lỗi
  static void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }

  /// Hiển thị thông báo cảnh báo
  static void warning(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      icon: const Icon(Icons.warning, color: Colors.white),
    );
  }

  /// Hiển thị thông báo thông tin
  static void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      icon: const Icon(Icons.info, color: Colors.white),
    );
  }
}
