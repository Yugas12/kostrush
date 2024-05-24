import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../controller/success_controller.dart';

/// Kelas SuccessView adalah kelas yang mewakili tampilan sukses.
/// Kelas ini merupakan turunan dari kelas BaseView dan menggunakan SuccessController sebagai kontroler.
class SuccessView extends BaseView<SuccessController> {
  const SuccessView({super.key});

  /// Mengembalikan widget AppBar yang diinginkan.
  ///
  /// Jika tidak ada AppBar yang diperlukan, maka akan mengembalikan null.
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  /// Mengembalikan warna latar belakang untuk tampilan sukses.
  ///
  /// Parameter [color] adalah warna yang dapat ditentukan oleh pengguna.
  /// Jika [color] tidak ditentukan, maka akan mengembalikan warna utama
  /// dari tema yang ditentukan.
  Color? backgroundColor({Color? color}) {
    return ColorsTheme.primaryColor[800];
  }

  /// Widget untuk menampilkan tampilan sukses.
  ///
  /// [context] - Konteks dari widget ini.
  /// [state] - State dari widget ini.
  ///
  /// Widget ini akan menampilkan judul, gambar, dan deskripsi yang diberikan
  /// melalui [controller.arguments]. Judul dan deskripsi akan ditampilkan
  /// dengan gaya teks yang telah ditentukan, sedangkan gambar akan ditampilkan
  /// dengan ukuran yang telah ditentukan.
  ///
  /// Contoh penggunaan:
  ///
  /// ```dart
  /// Widget body(BuildContext context, state) {
  ///   return SuccessView();
  /// }
  /// ```
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
          ),
          gap(48),
          SizedBox(
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
