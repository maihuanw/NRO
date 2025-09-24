import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nro/core/get/bindings.dart';
import 'package:nro/core/get/pages.dart';
class GetApp extends StatelessWidget {
  const GetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NRO",
      theme: ThemeData(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
    );
  }
}
