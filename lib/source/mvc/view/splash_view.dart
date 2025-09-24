import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
        backgroundColor: Colors.white,
      body: Image.network("https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fnapcard.net%2Fnap-ngoc-rong&psig=AOvVaw3L1FwU2zt5SA3KzyBix7yQ&ust=1758252389159000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCNCXp9uu4Y8DFQAAAAAdAAAAABAE",
      fit: BoxFit.cover,
        height: 200,
        width: 200,
      ),
    );
  }
}
