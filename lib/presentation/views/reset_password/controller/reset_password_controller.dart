import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/views/reset_password/argument/reset_password_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../../res/routes/app_routes.dart';
import '../../success/argument/success_argument.dart';

class ResetPasswordController
    extends BaseController<ResetPasswordArgument, NoState> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initComponent() {
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
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void navigateToSuccess() {
    Get.toNamed(
      AppRoutes.success,
      arguments: SuccessArgument(
          context: arguments.context,
          title: "Berhasil diubah!",
          description: "Selamat! kata sandi telah berhasil diubah.",
          buttonText: ""),
    );
  }
}
