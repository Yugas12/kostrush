import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'typography_theme.dart';

/// Kelas `MainTheme` berisi tema-tema yang digunakan dalam aplikasi.
class MainTheme {
  /// Mengembalikan tema cahaya dengan konfigurasi yang telah ditentukan.
  ///
  /// [context] - Konteks dari aplikasi.
  ///
  /// Tema cahaya mencakup konfigurasi warna, tipografi, dan gaya tombol.
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      // Konfigurasi warna
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: ColorsTheme.primaryColor,
            error: ColorsTheme.errorColor,
            onPrimary: ColorsTheme.neutralColor[1000],
            onBackground: ColorsTheme.neutralColor[10],
            onError: ColorsTheme.errorColor[90],
            primaryContainer: ColorsTheme.primaryColor,
            background: ColorsTheme.neutralColor[1000],
          ),
      // Konfigurasi tipografi
      textTheme: TypographyTheme.mainTextTheme(context)
          .copyWith(
            labelLarge: TypographyTheme.labelLarge,
            labelMedium: TypographyTheme.labelMedium,
            labelSmall: TypographyTheme.labelSmall,
            bodyLarge: TypographyTheme.bodyLarge,
            bodyMedium: TypographyTheme.bodyMedium,
            bodySmall: TypographyTheme.bodySmall,
            displayLarge: TypographyTheme.displayLarge,
            displayMedium: TypographyTheme.displayMedium,
            displaySmall: TypographyTheme.displaySmall,
            headlineLarge: TypographyTheme.headlineLarge,
            headlineMedium: TypographyTheme.headlineMedium,
            headlineSmall: TypographyTheme.headlineSmall,
            titleLarge: TypographyTheme.titleLarge,
            titleMedium: TypographyTheme.titleMedium,
            titleSmall: TypographyTheme.titleSmall,
          )
          .apply(
            bodyColor: ColorsTheme.neutralColor[100],
          ),
      // Konfigurasi tema AppBar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TypographyTheme.labelLarge,
        color: ColorsTheme.primaryColor[800],
        foregroundColor: ColorsTheme.neutralColor[1000],
      ),
      // Konfigurasi tema tombol terisi
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TypographyTheme.labelMedium,
          ),
        ),
      ),
      // Konfigurasi tema tombol teks
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TypographyTheme.labelMedium,
          ),
        ),
      ),
    );
  }

  /// Mengembalikan tema gelap dengan konfigurasi yang telah ditentukan.
  ///
  /// [context] - Konteks dari aplikasi.
  ///
  /// Tema gelap hanya menggunakan konfigurasi bawaan dari `ThemeData.dark()`.
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith();
  }
}
