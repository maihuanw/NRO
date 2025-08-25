import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maihuan/core/widget/sizedbox.dart';
import 'package:maihuan/mvc/common/elevated_button.dart';
import 'package:maihuan/mvc/common/text_form_field.dart';
import 'package:maihuan/mvc/common/text_title.dart';
import 'package:maihuan/mvc/controller/forget_password_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextTitle(text: "Forget password"),
          SizedWidget.h8,
          CustomTextField(
              controller: controller.phoneController,
              hintText: "Input your phone"
          ),
          SizedWidget.h8,
          Obx((){
            if(!controller.showOTP.value) return SizedBox();
            return Column(
              children: [
                SizedWidget.h20,
              PinCodeTextField(
                  appContext: context,
                  length: 6,
                controller: controller.otpController,
                keyboardType: TextInputType.number,
                onChanged: (value){
                    print("Otp : $value");
                },
                onCompleted: (value){
                    print("Complete $value");
                    controller.getOTP();
                },
              ),
              ],
            );
          }),
          SizedWidget.h8,
          CustomElevatedButton(
              text: "Get OTP",
              onPressed: (){
                  controller.forgetPassword();
              },
              width: double.infinity,
              height: 60,
              backgroundColor: Colors.redAccent,
              icon: Icons.density_large,
              fontSize: 16,
              textColor: Colors.white),
          SizedWidget.h8,

        ],
      ),
    );
  }
}
