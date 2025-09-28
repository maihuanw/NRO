import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/common/app_space.dart';
import '../../common/elevated_button.dart';
import '../../common/text_form_field.dart';
import '../../common/text_title.dart';
import '../../controller/auth/forget_password_controller.dart';

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
          AppSpace.h8,
          CustomTextField(
              controller: controller.phoneController,
              hintText: "Input your phone"
          ),
          AppSpace.h8,
          Obx((){
            if(!controller.showOTP.value) return SizedBox();
            return Column(
              children: [
                AppSpace.h20,
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
          AppSpace.h8,
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
          AppSpace.h8,

        ],
      ),
    );
  }
}
