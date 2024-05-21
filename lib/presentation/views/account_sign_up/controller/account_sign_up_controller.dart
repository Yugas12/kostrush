import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';
import 'package:kostrushapp/presentation/views/account_sign_up/argument/account_sign_up_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/enum/otp_purpose_enum.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../success/argument/success_argument.dart';

class AccountSignUpController
    extends BaseController<AccountSignUpArgument, NoState> {
  final _repository = Get.find<AuthRepository>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initComponent() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void register() async {
    if (emailController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Email tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      return;
    }

    if (passwordController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Password tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Konfirmasi password tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Password dan konfirmasi password tidak sama"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      return;
    }

    final response = await _repository.signUp(
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: arguments.phoneNumber,
      name: arguments.name,
      address: arguments.address ?? "",
      occupation: arguments.occupation ?? "",
    );

    response.fold(
      (exception) {
        Get.dialog(AlertDialog(
          title: Text("Error"),
          content: Text(
              HttpErrorHandler.parseErrorResponse(exception.response?.data)),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ));
      },
      (response) {
        Get.toNamed(
          AppRoutes.success,
          arguments: SuccessArgument(
              context: OtpPurposeEnum.signUp,
              title: "Registrasi Berhasil",
              description:
                  "Akun anda berhasil terdaftar. Silahkan login untuk melanjutkan.",
              buttonText: ""),
        );
      },
    );
  }
}
