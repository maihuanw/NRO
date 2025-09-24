import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nro/core/common/padding.dart';
import 'package:nro/core/common/space.dart';
import 'package:nro/source/common/app_text.dart';
import 'package:nro/source/mvc/view/auth/register_view.dart';

import '../../../common/app_form_filed.dart';
import '../../controller/login_controller.dart';
import 'forget_pass_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.small),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/logo.jpg", height: 100)),
              Center(child: Text("Đăng Nhập", style: AppText.title)),
              AppSpacing.h8,
              //Center(child: Text("Đăng nhập vào hệ thống", style: AppText.subtitle)),
              AppSpacing.h12,
              Text("Tài khoản", style: AppText.subtitle),
              AppSpacing.h8,
              TextFieldForm(
                controller: controller.usernameController,
                label: "Tài khoản",
                hint: "Nhập tài khoản",
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.account_circle,
                validator: (value) =>
                value == null || value.isEmpty ? "Vui lòng nhập số điện thoại" : null,
              ),
              AppSpacing.h12,
              Text("Mật khẩu", style: AppText.subtitle),
              AppSpacing.h8,
              Obx(() => TextFieldForm(
                controller: controller.passwordController,
                label: "Mật khẩu",
                hint: "Nhập mật khẩu",
                isPassword: controller.isPasswordHidden.value,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.lock,
                suffixIcon: controller.isPasswordHidden.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixTap: () {
                  controller.isPasswordHidden.value =
                  !controller.isPasswordHidden.value;
                },
                validator: (value) =>
                value == null || value.isEmpty ? "Vui lòng nhập mật khẩu" : null,
              )),
              AppSpacing.h24,
              GestureDetector(
                  onTap: (){
                    Get.to(ForgotPasswordView());
                  },
                  child: Text("Quên mật khẩu ?", style: AppText.subtitle,)),
              AppSpacing.h16,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Đăng nhập"),
                ),
              ),
              AppSpacing.h8,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(
                        RegisterView()
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Đăng ký"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
