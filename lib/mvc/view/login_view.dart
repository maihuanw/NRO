import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maihuan/core/widget/images.dart';
import 'package:maihuan/core/widget/radius.dart';
import 'package:maihuan/mvc/common/elevated_button.dart';
import 'package:maihuan/mvc/common/text_form_field.dart';
import 'package:maihuan/mvc/common/text_title.dart';
import 'package:maihuan/mvc/controller/login_controller.dart';
import 'package:maihuan/mvc/view/register_view.dart';
import '../../core/widget/sizedbox.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(ImageWidget.logo, height: 120, width: 120,),
          SizedWidget.h10,
          TextTitle(text: "Account"),
          SizedWidget.h6,
          CustomTextField(
            controller: controller.phoneController,
            hintText: "Phone number",
            labelText: "Phone number",
            prefixIcon: Icons.account_circle_outlined,
            validator: (value) =>
            (value ==null || value.isEmpty)? "Email required" : null,
          ),
          SizedWidget.h6,
          TextTitle(text: "Password"),
          SizedWidget.h6,
          CustomTextField(
            controller: controller.passController,
            hintText: "Password",
            labelText: "Password",
            prefixIcon: Icons.password_outlined,
            validator: (value) =>
            (value==null || value.isEmpty)? "Password required": null,
          ),
          SizedWidget.h6,
          GestureDetector(
            onTap: (){

            },
              child: TextTitle(text: "Forget password?")),
          SizedWidget.h6,
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
          SizedWidget.h6,
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
