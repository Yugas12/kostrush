import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/image_view/circle_image.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../components/appbar/default_appbar.dart';
import '../controller/profile_controller.dart';

class ProfileView extends BaseView<ProfileController> {
  const ProfileView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Profil",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _profileBuilder(),
            _profileSetting(),
            _otherSetting(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MainButton(
                label: "Keluar",
                onTap: () {
                  controller.signOut();
                },
                buttonWidth: ButtonWidth.full,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileBuilder() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleImage.network(imageEndpoint: "", radius: 50),
            gap(8),
            Text(
              controller.state?.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TypographyTheme.labelLarge,
            ),
            gap(8),
            Text(controller.state?.email ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _profileSetting() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pengaturan Profil",
            style: TypographyTheme.labelMedium,
          ),
          gap(8),
          _profileSettingItem(
            title: "Edit Profil",
            onTap: () {
              controller.navigateToEditProfile();
            },
          ),
          gap(8),
          _profileSettingItem(
            title: "Detail Profil",
            onTap: () {
              controller.navigateToDetailProfile();
            },
          ),
          gap(8),
          _profileSettingItem(
            title: "Ubah Password",
            onTap: () {
              controller.navigateToChangePassword();
            },
          ),
        ],
      ),
    );
  }

  Widget _otherSetting() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lainnya",
            style: TypographyTheme.labelMedium,
          ),
          gap(8),
          _profileSettingItem(
            title: "Tentang Kami",
            onTap: () {
              controller.navigateToAboutUs();
            },
          ),
          gap(8),
          _profileSettingItem(
            title: "Pusat Bantuan",
            onTap: () {
              controller.navigateToHelpCenter();
            },
          ),
          gap(8),
          _profileSettingItem(
            title: "Kebijakan & Privasi",
            onTap: () {
              controller.navigateToPolicy();
            },
          ),
        ],
      ),
    );
  }

  Widget _profileSettingItem({
    required String title,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(title),
            const Spacer(),
            Icon(Icons.keyboard_arrow_right_outlined),
          ],
        ),
      ),
    );
  }
}
