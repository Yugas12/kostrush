import 'package:flutter/material.dart';

import '../../presentation/themes/color_theme.dart';

mixin CustomSliverMixin {
  SliverToBoxAdapter sliverDivider() {
    return SliverToBoxAdapter(
      child: Divider(
        height: 16,
        thickness: 2,
        color: ColorsTheme.primaryColor,
      ),
    );
  }
}
