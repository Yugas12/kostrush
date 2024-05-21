import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/input/main_text_input.dart';
import '../../../themes/typography_theme.dart';
import '../controller/sign_up_controller.dart';

class SignUpView extends BaseView<SignUpController> {
  const SignUpView({super.key});

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
            _agreementBuilder(),
            gap(16),
            MainButton(
              label: "Lanjut",
              buttonWidth: ButtonWidth.full,
              onTap: () {
                controller.navigateToAccountSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Column(
      children: [
        MainTextInput(
          label: "Nama Lengkap",
          hintText: "Masukkan Nama Lengkap Anda",
          controller: controller.nameController,
        ),
        gap(16),
        MainTextInput(
          label: "Pekerjaan",
          hintText: "Masukkan Pekerjaan Anda",
          controller: controller.occupationController,
        ),
        gap(16),
        MainTextInput(
          label: "Nomor Telepon",
          hintText: "Masukkan Nomor Telepon Anda",
          controller: controller.phoneController,
          inputType: TextInputType.phone,
        ),
        gap(16),
        MainTextInput(
          label: "Alamat",
          hintText: "Masukkan Alamat Anda",
          controller: controller.addressController,
          maxLines: 6,
        ),
        gap(16),
      ],
    );
  }

  Widget _agreementBuilder() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.isAgree.value,
            onChanged: (value) {
              controller.isAgree.value = value!;
            },
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dengan ini Anda telah menyetujui",
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Kebijakan & Privasi Layanan Kami.",
                style: TypographyTheme.labelMedium.copyWith(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
