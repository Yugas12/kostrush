import 'package:flutter/material.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../../res/assets/image_asset_constant.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/image_view/circle_image.dart';
import '../../../components/input/main_text_input.dart';
import '../controller/detail_profile_controller.dart';

class DetailProfileView extends BaseView<DetailProfileController> {
  const DetailProfileView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Detail Profil",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: _formBuilder(),
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleImage.asset(
          imageAsset: ImageAssetConstant.profileBlank,
          radius: 50,
        ),
        gap(16),
        MainTextInput(
          label: "Nama Lengkap",
          hintText: "Masukkan Nama Lengkap Anda",
          controller: controller.nameController,
          focusNode: controller.noFocusNode,
        ),
        gap(16),
        MainTextInput(
          label: "Pekerjaan",
          hintText: "Masukkan Pekerjaan Anda",
          controller: controller.occupationController,
          focusNode: controller.noFocusNode,
        ),
        gap(16),
        MainTextInput(
          label: "Nomor Telepon",
          hintText: "Masukkan Nomor Telepon Anda",
          controller: controller.phoneController,
          inputType: TextInputType.phone,
          focusNode: controller.noFocusNode,
        ),
        gap(16),
        MainTextInput(
          label: "Alamat",
          hintText: "Masukkan Alamat Anda",
          controller: controller.addressController,
          maxLines: 6,
          focusNode: controller.noFocusNode,
        ),
        gap(16),
        MainTextInput(
          label: "Email",
          hintText: "Masukkan Email Anda",
          controller: controller.emailController,
          inputType: TextInputType.emailAddress,
          focusNode: controller.noFocusNode,
        ),
      ],
    );
  }
}
