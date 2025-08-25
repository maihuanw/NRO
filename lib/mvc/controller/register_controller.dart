import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maihuan/core/api/api_service.dart';

class RegisterController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  
  final ApiService dio = ApiService();
  
  Future<void> register () async{
    try
        {
          final response = await dio.post("data/User",data: {
            "username":phoneController.text.trim(),
            "password":passController.text.trim(),
            "fullname":nameController.text.trim(),
          });
          if(response.statusCode==200){
            print("Register Success");
          }
          else{
            print("erroll");
          }
        } catch (e){
      print("errol $e");
      return Future.error(e);
    }

  }
}