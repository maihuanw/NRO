import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../source/mvc/view/splash_view.dart';
import '../language/app_translation.dart';
import 'bindings.dart';

class GetApp extends StatelessWidget {
  const GetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NRO",
      defaultTransition: Transition.cupertino,
      home: SplashView(),
      initialBinding: AppBinding(),
      translations: AppTranslations(),
      locale: const Locale('vi', 'VN'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
