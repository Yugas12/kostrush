import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../controller/success_controller.dart';

class SuccessView extends BaseView<SuccessController> {
  const SuccessView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color? backgroundColor({Color? color}) {
    return ColorsTheme.primaryColor[800];
  }

  @override
  Widget body(BuildContext context, state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.arguments.title,
            style: TypographyTheme.headlineMedium.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          gap(48),
          Container(
            height: 280,
            width: 280,
            child: Image.asset(
              controller.successAsset,
              fit: BoxFit.cover,
            ),
          ),
          gap(48),
          Text(
            controller.arguments.description,
            textAlign: TextAlign.center,
            style: TypographyTheme.bodyLarge.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
