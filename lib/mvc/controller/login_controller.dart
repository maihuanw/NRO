import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maihuan/core/api/api_service.dart';

class LoginController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  ApiService dio = ApiService();
  Future<void> login() async{
    try {
      final response = await dio.post("signin/", data: {
        "username":phoneController.text.trim(),
        "password":passController.text.trim(),
      });
     if (response.statusCode ==200){
       final token = response.data["token"];
       if(token!=null){
         GetStorage().write("token", token);
       }
       print("Success");
     }
     else{
       print("Errol");
     }
    } catch (e){
      print("e");
    }
  }
  @override
  void onClose(){
    phoneController.dispose();
    passController.dispose();
    super.onClose();
  }
}