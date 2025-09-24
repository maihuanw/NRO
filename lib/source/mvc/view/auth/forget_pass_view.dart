import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nro/core/common/padding.dart';
import 'package:nro/core/common/space.dart';
import 'package:nro/source/common/app_text.dart';
import '../../../common/app_elevated.dart';
import '../../../common/app_form_filed.dart';
import '../../controller/forget_pass_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quên mật khẩu"),
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
              Center(child: Text("Quên mật khẩu", style: AppText.title)),
              AppSpacing.h8,
              Center(
                child: Text(
                  "Nhập số điện thoại để nhận hướng dẫn khôi phục",
                  style: AppText.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              AppSpacing.h24,
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
              AppSpacing.h24,
              AppButton(
                text: "Gửi yêu cầu",
                onPressed: controller.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
