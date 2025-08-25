import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maihuan/mvc/view/splash_view.dart';

import '../api/bindings.dart';

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
    );
  }
}
