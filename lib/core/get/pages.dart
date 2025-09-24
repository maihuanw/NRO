import 'package:get/get.dart';
import 'package:nro/core/get/bindings.dart';
import 'package:nro/core/get/route.dart';
import 'package:nro/source/mvc/view/home_view.dart';
import 'package:nro/source/mvc/view/auth/register_view.dart';

import '../../source/mvc/controller/login_controller.dart';
import '../../source/mvc/controller/splash_controller.dart';
import '../../source/mvc/view/auth/login_view.dart';
import '../../source/mvc/view/splash_view.dart';

class AppPages{
  AppPages._();
  static const initial = AppRoute.login;

  static final routes = [
    GetPage(
      name: AppRoute.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put<SplashController>(SplashController());
      }),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.put<LoginController>(LoginController());
      }),
    ),
    GetPage(
        name: AppRoute.home,
        page: ()=> HomeView(),
        binding: HomeBindings()
    ),
    GetPage(
        name: AppRoute.register,
        page: ()=> RegisterView(),
        binding: RegisterBindings())

];
}