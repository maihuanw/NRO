import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:maihuan/core/getx/bindings.dart';
import 'package:maihuan/source/mvc/view/auth/forget_password_view.dart';
import 'package:maihuan/source/mvc/view/auth/login_view.dart';
import 'package:maihuan/source/mvc/view/auth/register_view.dart';
import 'package:maihuan/source/mvc/view/home/history_view.dart';
import 'package:maihuan/source/mvc/view/home/home_view.dart';
import 'package:maihuan/source/mvc/view/home/setting_view.dart';
import 'package:maihuan/source/mvc/view/home/top_up_view.dart';
import 'package:maihuan/source/mvc/view/main_home/mid_account_view.dart';
import 'package:maihuan/source/mvc/view/main_home/random_account_view.dart';
import 'package:maihuan/source/mvc/view/main_home/ware_house_view.dart';
import 'package:maihuan/source/mvc/view/splash_view.dart';

abstract class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const forgetPass = '/forgetPass';
  static const home = '/home';
  static const history = '/history';
  static const topUp = '/topUp';
  static const setting = '/setting';
  static const midAccount = '/midAccount';
  static const randomAccount ='/randomAccount';
  static const wareHouse = '/wareHouse';
}

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashView(), binding: AppBinding(),),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.login, page: () => LoginView(), binding: LoginBinding(),),
    GetPage(name: Routes.register, page:()=> RegisterView(), binding: RegisterBinding()),
    GetPage(name: Routes.forgetPass, page: ()=>ForgetPasswordView(), binding: ForgetPasswordBinding()),
    GetPage(name: Routes.history, page: ()=>HistoryView(), binding: HistoryBinding(),),
    GetPage(name: Routes.topUp, page: ()=>TopUpView(), binding: TopUpBinding()),
    GetPage(name: Routes.setting, page: ()=>SettingView(), binding: SettingBinding()),
    GetPage(name: Routes.midAccount, page: ()=>MidAccountView(), binding: MidAccountBinding()),
    GetPage(name: Routes.randomAccount, page:()=> RandomAccountView(), binding: RandomAccountBinding()),
    GetPage(name: Routes.wareHouse, page: ()=>WareHouseView(), binding: WareHouseBinding()),

  ];
}
