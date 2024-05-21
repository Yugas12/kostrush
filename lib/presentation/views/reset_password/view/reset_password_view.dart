import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/input/main_password_text_input.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/button/main_button.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordView extends BaseView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Buat Kata Sandi Baru ",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Silahkan masukkan email Anda"),
          gap(8),
          MainPasswordTextInput(
            controller: controller.passwordController,
          ),
          gap(8),
          MainPasswordTextInput(
            controller: controller.confirmPasswordController,
            label: "Konfirmasi Kata Sandi",
          ),
          gap(16),
          MainButton(
            label: "Lanjut",
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.navigateToSuccess();
            },
          )
        ],
      ),
    );
  }
}
