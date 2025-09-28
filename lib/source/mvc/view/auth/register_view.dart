import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/common/app_space.dart';
import '../../common/elevated_button.dart';
import '../../common/text_form_field.dart';
import '../../common/text_title.dart';
import '../../controller/auth/register_controller.dart';
import 'login_view.dart';

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
          AppSpace.h8,
          CustomTextField(controller: controller.phoneController, hintText: "Phone number"),
          AppSpace.h8,
          CustomTextField(controller: controller.passController, hintText: "Password"),
          AppSpace.h8,
          CustomTextField(controller: controller.nameController, hintText: "Full name"),
          AppSpace.h8,
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
          AppSpace.h8,
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
