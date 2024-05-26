import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/dto/profile_dto.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:kostrushapp/domain/repository/profile_repository.dart';
import 'package:kostrushapp/presentation/views/change_password/argument/change_password_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../res/routes/app_routes.dart';
import '../../../../utils/handler/http_error_handler.dart';
import '../../success/argument/success_argument.dart';

/// Controller untuk halaman perubahan kata sandi.
class ChangePasswordController extends BaseController<ChangePasswordArgument, ProfileDto> {
  final _repository = Get.find<ProfileRepository>();

  late TextEditingController newPasswordController;
  late TextEditingController newRePasswordController;

  @override
  void initComponent() {
    newRePasswordController = TextEditingController();
    newPasswordController = TextEditingController();
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
    newRePasswordController.dispose();
    newPasswordController.dispose();
  }

  /// Fungsi untuk mengubah kata sandi.
  void changePassword() async {
    if (newPasswordController.text.isEmpty || newRePasswordController.text.isEmpty) {
      Get.dialog(AlertDialog(
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
      ));
      return;
    }

    if (newPasswordController.text != newRePasswordController.text) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Password tidak sama"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ));
      return;
    }

    final result = await _repository.changePassword(
      password: newPasswordController.text,
    );

    result.fold((exception) {
      emitError(exception.toString());
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text(HttpErrorHandler.parseErrorResponse(exception.response?.data)),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ));
    }, (response) {
      Get.toNamed(
        AppRoutes.success,
        arguments: SuccessArgument(
          context: arguments.context,
          title: "Kata Sandi Berhasil Diubah",
          description: "Jangan pernah membagikan kata sandi Anda kepada siapa pun.",
          buttonText: "Kembali ke Halaman Login",
        ),
      );
    });
  }
}
