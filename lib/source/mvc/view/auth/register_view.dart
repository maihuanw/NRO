import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nro/core/common/padding.dart';
import 'package:nro/core/common/space.dart';
import 'package:nro/source/common/app_text.dart';
import '../../../common/app_elevated.dart';
import '../../../common/app_form_filed.dart';
import '../../controller/register_controller.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng ký"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.small),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Tạo tài khoản", style: AppText.title)),
              AppSpacing.h8,
              Center(child: Text("Nhập thông tin để đăng ký", style: AppText.subtitle)),
              AppSpacing.h24,

              Text("Tên người dùng", style: AppText.subtitle),
              AppSpacing.h8,
              TextFieldForm(
                controller: controller.usernameController,
                label: "Tên người dùng",
                hint: "Nhập tên",
                prefixIcon: Icons.person,
                validator: (value) =>
                value == null || value.isEmpty ? "Vui lòng nhập tên" : null,
              ),

              AppSpacing.h12,
              Text("Số điện thoại", style: AppText.subtitle),
              AppSpacing.h8,
              TextFieldForm(
                controller: controller.phoneController,
                label: "Số điện thoại",
                hint: "Nhập số điện thoại",
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone,
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

              AppSpacing.h12,
              Text("Xác nhận mật khẩu", style: AppText.subtitle),
              AppSpacing.h8,
              Obx(() => TextFieldForm(
                controller: controller.confirmPasswordController,
                label: "Xác nhận mật khẩu",
                hint: "Nhập lại mật khẩu",
                isPassword: controller.isConfirmPasswordHidden.value,
                prefixIcon: Icons.lock,
                suffixIcon: controller.isConfirmPasswordHidden.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixTap: () {
                  controller.isConfirmPasswordHidden.value =
                  !controller.isConfirmPasswordHidden.value;
                },
                validator: (value) =>
                value == null || value.isEmpty ? "Vui lòng nhập lại mật khẩu" : null,
              )),

              AppSpacing.h24,
              AppButton(
                text: "Đăng ký",
                onPressed: controller.register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
