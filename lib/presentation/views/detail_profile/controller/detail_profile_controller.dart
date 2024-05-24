import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/presentation/components/focus_node/no_focus_node.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';

/// Kelas [DetailProfileController] adalah pengontrol untuk tampilan detail profil.
/// Kelas ini mengimplementasikan [BaseController] dengan argumen [NoArguments] dan model [ProfileModel].
class DetailProfileController extends BaseController<NoArguments, ProfileModel> {
  final _mainRepository = Get.find<MainRepository>();

  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  late NoFocusNode noFocusNode;

  @override
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    noFocusNode = NoFocusNode();
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
        content: Text("Terjadi kesalahan. Silakan coba lagi nanti."),
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

  @override
  void disposeComponent() {
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    noFocusNode.dispose();
  }
}
