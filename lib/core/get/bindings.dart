import 'package:get/get.dart';
import 'package:nro/source/mvc/controller/register_controller.dart';
import 'package:nro/source/mvc/controller/splash_controller.dart';

import '../../source/mvc/controller/home_controller.dart';
import '../../source/mvc/controller/login_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
  }
}