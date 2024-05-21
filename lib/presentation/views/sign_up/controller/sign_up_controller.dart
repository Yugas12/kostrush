import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/presentation/views/account_sign_up/argument/account_sign_up_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';

class SignUpController extends BaseController<NoArguments, NoState> {
  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  RxBool isAgree = false.obs;

  @override
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
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
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    isAgree.close();
  }

  void navigateToAccountSignUp() {
    if (nameController.text.isEmpty) {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Nama tidak boleh kosong"),
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

    if (occupationController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Pekerjaan tidak boleh kosong"),
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

    if (phoneController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Nomor telepon tidak boleh kosong"),
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

    if (addressController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Alamat tidak boleh kosong"),
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

    if (!isAgree.value) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Anda harus menyetujui syarat dan ketentuan"),
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

    Get.toNamed(
      AppRoutes.signUpAccount,
      arguments: AccountSignUpArgument(
        name: nameController.text,
        phoneNumber: phoneController.text,
        occupation: occupationController.text,
        address: addressController.text,
      ),
    );
  }
}
