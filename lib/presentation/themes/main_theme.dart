import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'typography_theme.dart';

/// MainTheme is a class that defines the theme of the application.
class MainTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: ColorsTheme.primaryColor,
            error: ColorsTheme.errorColor,
            onPrimary: ColorsTheme.neutralColor[1000],
            onBackground: ColorsTheme.neutralColor[10],
            onError: ColorsTheme.errorColor[90],
            primaryContainer: ColorsTheme.primaryColor,
            background: ColorsTheme.neutralColor[1000],
          ),
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
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TypographyTheme.labelLarge,
        color: ColorsTheme.primaryColor[800],
        foregroundColor: ColorsTheme.neutralColor[1000],
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TypographyTheme.labelMedium,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TypographyTheme.labelMedium,
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith();
  }
}
