import 'dart:async';
import 'package:get/get.dart';
import 'package:nro/core/get/route.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(AppRoute.login);
    });
  }

}