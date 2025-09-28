import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maihuan/source/mvc/view/auth/register_view.dart';
import '../../../../core/common/app_images.dart';
import '../../../../core/common/app_space.dart';
import '../../common/elevated_button.dart';
import '../../common/text_form_field.dart';
import '../../common/text_title.dart';
import '../../controller/auth/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(AppImages.logo, height: 120, width: 120,),
          AppSpace.h10,
          TextTitle(text: "Account"),
          AppSpace.h6,
          CustomTextField(
            controller: controller.phoneController,
            hintText: "Phone number",
            labelText: "Phone number",
            prefixIcon: Icons.account_circle_outlined,
            validator: (value) =>
            (value ==null || value.isEmpty)? "Email required" : null,
          ),
          AppSpace.h6,
          TextTitle(text: "Password"),
          AppSpace.h6,
          CustomTextField(
            controller: controller.passController,
            hintText: "Password",
            labelText: "Password",
            prefixIcon: Icons.password_outlined,
            validator: (value) =>
            (value==null || value.isEmpty)? "Password required": null,
          ),
          AppSpace.h6,
          GestureDetector(
            onTap: (){

            },
              child: TextTitle(text: "Forget password?")),
          AppSpace.h6,
          CustomElevatedButton(
              text: "Login",
              onPressed: (){
                controller.login();
              },
              width: double.infinity,
              height: 60,
              backgroundColor: Colors.red,
              icon: Icons.login,
              borderRadius: 12,
              fontSize: 16,
              textColor: Colors.white,
          ),
          AppSpace.h6,
          RichText(
              text: TextSpan(
            text: "You are not account?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16),
            children: <TextSpan>[
             TextSpan(
               text: "Register",style: TextStyle(color: Colors.blue, fontSize: 16),
               recognizer: TapGestureRecognizer()..onTap= (){
                 Get.offAll(RegisterView());
               },
             )
            ],
          ))
        ],
      ),
    );
  }
}
