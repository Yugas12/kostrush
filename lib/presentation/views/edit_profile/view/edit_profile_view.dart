import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/input/main_text_input.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/image_view/circle_image.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileView extends BaseView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Edit Profil",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profileImageBuilder(),
              gap(16),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImageBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        controller.imageFile.value != null
            ? CircleImage.file(
                imageFile: controller.imageFile.value?.path ?? "",
                radius: 50,
              )
            : CircleImage.network(
                imageEndpoint: "",
                radius: 50,
              ),
        gap(8),
      ],
    );
  }

  Widget _formBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        MainTextInput(
          label: "Email",
          hintText: "Masukkan Email Anda",
          controller: controller.emailController,
          inputType: TextInputType.emailAddress,
        ),
        gap(16),
        MainButton(
          label: "Simpan",
          onTap: () {
            controller.updateProfile();
          },
          buttonWidth: ButtonWidth.full,
        ),
      ],
    );
  }
}
