import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:kostrushapp/utils/handler/http_error_handler.dart';

import '../../../../../base/base_controller.dart';

class SignInController extends BaseController<NoArguments, NoState> {
  final _repository = Get.find<AuthRepository>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initComponent() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
  }

  void signIn() async {
    final data = await _repository.signIn(
      email: emailController.text,
      password: passwordController.text,
    );

    data.fold((exception) {
      if (exception.response?.statusCode == 401) {
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
      }
    }, (result) {
      Get.offNamed(AppRoutes.main);
    });
  }

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }
}
