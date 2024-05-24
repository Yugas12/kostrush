import 'package:flutter/material.dart';

import '../../presentation/themes/color_theme.dart';

/// Mixin yang menyediakan fungsi-fungsi kustom untuk penggunaan Sliver.
mixin CustomSliverMixin {
  /// Membuat widget SliverToBoxAdapter yang berisi Divider.
  ///
  /// Widget ini digunakan untuk menampilkan garis pemisah pada daftar sliver.
  /// Tinggi, ketebalan, dan warna garis dapat disesuaikan.
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
