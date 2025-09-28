import 'package:get/get.dart';
import 'package:maihuan/source/mvc/controller/home/history_controller.dart';
import 'package:maihuan/source/mvc/controller/home/home_controller.dart';
import 'package:maihuan/source/mvc/controller/home/setting_controller.dart';
import 'package:maihuan/source/mvc/controller/home/top_up_controller.dart';
import 'package:maihuan/source/mvc/controller/main_home/mid_account_controller.dart';
import 'package:maihuan/source/mvc/controller/main_home/random_account_controller.dart';
import 'package:maihuan/source/mvc/controller/main_home/ware_house_controller.dart';
import 'package:maihuan/source/mvc/controller/spash_controller.dart';
import '../../source/mvc/controller/auth/forget_password_controller.dart';
import '../../source/mvc/controller/auth/login_controller.dart';
import '../../source/mvc/controller/auth/register_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(SplashController());
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
class HomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HomeController>(()=>HomeController());
  }
}
class HistoryBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HistoryController>(()=>HistoryController());
  }
}
class TopUpBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<TopUpController>(()=>TopUpController());
  }
}
class SettingBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SettingController>(()=>SettingController());
  }
}
class MidAccountBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<MidAccountController>(()=>MidAccountController());
  }
}
class RandomAccountBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<RandomAccountController>(()=>RandomAccountController());
  }
}
class WareHouseBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<WareHouseController>(()=>WareHouseController());
  }
}
