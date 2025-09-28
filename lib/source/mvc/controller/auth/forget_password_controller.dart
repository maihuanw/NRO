import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maihuan/core/api/api_service.dart';

class ForgetPasswordController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController =TextEditingController();
  final ApiService dio =ApiService();
  final showOTP = false.obs;

  Future<void> forgetPassword () async{
    try {
      final response = await dio.get("otp/",query: {
        "phone":phoneController.text.trim()
      });
      if(response.statusCode ==200){
        showOTP.value=true;
      }
    } catch (e){
      print(e);
    }
  }
  Future<void> getOTP () async{
    try{
      final otp = await dio.get("checkpin/",query: {
        "otp":otpController.text.trim(),
      });
      if(otp.statusCode==200){
        print("Sucess");

      }
    } catch (e) {
      print(e);
    }
  }
}