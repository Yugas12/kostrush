import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/presentation/views/change_password/argument/change_password_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../domain/repository/auth_repository.dart';
import '../../../../../../domain/repository/main_repository.dart';

class ProfileController extends BaseController<NoArguments, ProfileModel> {
  final _authRepository = Get.find<AuthRepository>();
  final _mainRepository = Get.find<MainRepository>();

  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();
    final data = await _mainRepository.getProfile();

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
    });
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  void navigateToEditProfile() async {
    await Get.toNamed(AppRoutes.editProfile);
    onRefresh();
  }

  void navigateToDetailProfile() {
    Get.toNamed(AppRoutes.detailProfile);
  }

  void navigateToChangePassword() {
    Get.toNamed(
      AppRoutes.changePassword,
      arguments: ChangePasswordArgument(
        context: OtpPurposeEnum.changePassword,
        email: state?.email ?? "",
      ),
    );
  }

  void navigateToPolicy() {
    Get.toNamed(AppRoutes.policy);
  }

  void navigateToAboutUs() {
    Get.toNamed(AppRoutes.aboutUs);
  }

  void navigateToHelpCenter() {
    Get.toNamed(AppRoutes.helpCenter);
  }

  void signOut() async {
    final data = await _authRepository.signOut();
    data.fold((exception) {
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
    }, (_) {});
    Get.offAllNamed(AppRoutes.signIn);
  }
}
