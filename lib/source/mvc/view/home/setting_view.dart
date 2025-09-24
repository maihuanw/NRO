import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Đây là màn hình Cài đặt",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
