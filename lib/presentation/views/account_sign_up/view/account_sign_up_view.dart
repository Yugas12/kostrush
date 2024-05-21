import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/input/main_password_text_input.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/button/main_button.dart';
import '../../../components/input/main_text_input.dart';
import '../controller/account_sign_up_controller.dart';

class AccountSignUpView extends BaseView<AccountSignUpController> {
  const AccountSignUpView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Daftarkan Akun Anda",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _formBuilder(),
            gap(16),
            MainButton(
              label: "Daftar",
              buttonWidth: ButtonWidth.full,
              onTap: () {
                controller.register();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Form(
      child: Column(
        children: [
          MainTextInput(
            label: "Email",
            hintText: "Masukkan Email Anda",
            controller: controller.emailController,
            inputType: TextInputType.emailAddress,
          ),
          gap(16),
          MainPasswordTextInput(controller: controller.passwordController),
          gap(16),
          MainPasswordTextInput(
            controller: controller.confirmPasswordController,
            label: "Konfirmasi Password",
          ),
        ],
      ),
    );
  }
}
