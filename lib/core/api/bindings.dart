import 'package:get/get.dart';
import 'package:maihuan/mvc/controller/forget_password_controller.dart';
import 'package:maihuan/mvc/controller/login_controller.dart';
import 'package:maihuan/mvc/controller/register_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){

  }
}
class LoginBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LoginController>(()=> LoginController());
  }
}
class RegisterBinding extends Bindings{
  @override
  void dependencies (){
    Get.lazyPut<RegisterController>(()=>RegisterController());
  }
}
class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ForgetPasswordController>(()=>ForgetPasswordController());
  }
}