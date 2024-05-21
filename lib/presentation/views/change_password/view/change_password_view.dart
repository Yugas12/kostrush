import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/input/main_password_text_input.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordView extends BaseView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Ubah Kata Sandi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Silahkan masukkan kata sandi Anda harus lebih dari 8 karakter dan berisi kombinasi angka dan huruf.",
            textAlign: TextAlign.center,
          ),
          gap(16),
          MainPasswordTextInput(
              controller: controller.newPasswordController,
              label: "Kata Sandi Baru"),
          gap(16),
          MainPasswordTextInput(
              controller: controller.newRePasswordController,
              label: "Ulangi Kata Sandi Baru"),
          gap(16),
          MainButton(
            label: "Ubah Kata Sandi",
            onTap: () {
              controller.changePassword();
            },
            buttonWidth: ButtonWidth.full,
          ),
        ],
      ),
    );
  }
}
