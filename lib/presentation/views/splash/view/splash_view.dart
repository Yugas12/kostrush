import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/res/assets/svg_asset_constant.dart';

import '../../../../base/base_view.dart';
import '../controller/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  bool? extendBody() {
    return true;
  }

  @override
  Color? backgroundColor({Color? color}) {
    return ColorsTheme.primaryColor[900];
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
