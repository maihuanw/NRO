import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maihuan/core/widget/sizedbox.dart';
import 'package:maihuan/mvc/common/elevated_button.dart';
import 'package:maihuan/mvc/common/text_form_field.dart';
import 'package:maihuan/mvc/common/text_title.dart';
import 'package:maihuan/mvc/view/login_view.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextTitle(text: "Register"),
          SizedWidget.h8,
          CustomTextField(controller: controller.phoneController, hintText: "Phone number"),
          SizedWidget.h8,
          CustomTextField(controller: controller.passController, hintText: "Password"),
          SizedWidget.h8,
          CustomTextField(controller: controller.nameController, hintText: "Full name"),
          SizedWidget.h8,
          CustomElevatedButton(
              text: "Register",
              onPressed: (){
                controller.register();
              },
              width: double.infinity,
              height: 60,
              backgroundColor: Colors.redAccent,
              icon: Icons.add_circle_outline,
              fontSize: 16,
              textColor: Colors.white
          ),
          SizedWidget.h8,
          RichText(text: TextSpan(
            text: "You are has account,",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                text: "login",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16),
                recognizer: TapGestureRecognizer()..onTap=(){
                  Get.offAll(LoginView());
                },
              ),
            ]
          ))
        ],
      ),
    );
  }
}
