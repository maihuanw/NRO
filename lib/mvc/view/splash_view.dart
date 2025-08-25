import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maihuan/mvc/controller/spash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/image/quythuong.jpg",
            height: 100,
            width: 100,),
        ],
      ),
    );
  }
}
