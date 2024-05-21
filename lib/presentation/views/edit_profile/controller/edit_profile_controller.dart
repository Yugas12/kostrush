import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/domain/repository/profile_repository.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../utils/handler/http_error_handler.dart';

class EditProfileController extends BaseController<NoArguments, ProfileModel> {
  final _repository = Get.find<ProfileRepository>();

  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  RxBool isFileChange = false.obs;
  Rxn<File> imageFile = Rxn<File>(null);

  @override
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onObserve() {}

  @override
  Future<void> onProcess() async {
    emitLoading();

    final data = await _repository.getProfile();

    data.fold((exception) {
      emitError(exception.toString());
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Something went wrong. Please try again later."),
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
      emitSuccess(response);

      nameController.text = response.name ?? "";
      occupationController.text = response.occupation ?? "";
      phoneController.text = response.phoneNumber ?? "";
      addressController.text = response.address ?? "";
      emailController.text = response.email ?? "";
    });
  }

  Future<void> updateProfile() async {
    final data = await _repository.updateProfile(
      name: nameController.text,
      occupation: occupationController.text,
      address: addressController.text,
      phoneNumber: phoneController.text,
      email: emailController.text,
    );

    data.fold((exception) {
      emitError(exception.toString());
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content:
            Text(HttpErrorHandler.parseErrorResponse(exception.response?.data)),
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
      Get.back();
    });
  }

  @override
  void disposeComponent() {
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();

    isFileChange.close();
    imageFile.close();
  }
}
