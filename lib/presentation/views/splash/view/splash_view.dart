import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/res/assets/svg_asset_constant.dart';

import '../../../../base/base_view.dart';
import '../controller/splash_controller.dart';

/// Kelas SplashView adalah kelas yang mewakili tampilan splash screen.
/// Ini merupakan turunan dari kelas BaseView dan menggunakan SplashController sebagai kontrolernya.
class SplashView extends BaseView<SplashController> {
  const SplashView({super.key});

  /// Mengembalikan widget AppBar yang diinginkan.
  ///
  /// Jika tidak ada AppBar yang diperlukan, maka akan mengembalikan null.
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override

  /// Fungsi ini mengembalikan nilai boolean yang menunjukkan apakah body perlu diperpanjang atau tidak.
  /// Jika nilai yang dikembalikan adalah `true`, maka body akan diperpanjang.
  /// Jika nilai yang dikembalikan adalah `false`, maka body tidak akan diperpanjang.
  /// Jika nilai yang dikembalikan adalah `null`, maka body akan mengikuti pengaturan default.
  bool? extendBody() {
    return true;
  }

  /// Mengembalikan warna latar belakang untuk tampilan splash.
  ///
  /// Parameter [color] adalah warna yang dapat ditentukan secara opsional.
  /// Jika [color] tidak ditentukan, maka akan mengembalikan warna utama
  /// dengan indeks 900 dari tema warna.
  @override
  Color? backgroundColor({Color? color}) {
    return ColorsTheme.primaryColor[900];
  }

  @override
  Widget body(BuildContext context, state) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Widget yang menampilkan logo pada tampilan splash screen.
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                SvgAssetConstant.logo,
                width: 320,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              controller.appVersion.value ?? "",
              style: TypographyTheme.labelMedium.copyWith(
                color: ColorsTheme.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
