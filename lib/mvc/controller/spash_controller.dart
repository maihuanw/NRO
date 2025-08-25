import 'dart:async';

import 'package:get/get.dart';

import '../view/login_view.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2),(){
      Get.offAll(LoginView());
    });
  }

}