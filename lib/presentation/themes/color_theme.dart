import 'package:flutter/material.dart';

/// Kelas ColorsTheme berisi kumpulan warna yang digunakan dalam tema aplikasi.
class ColorsTheme {
  ColorsTheme._();

  /// Warna utama yang digunakan dalam tema aplikasi.
  static MaterialColor primaryColor = const MaterialColor(0xFF3f206c, {
    100: Color(0xFF251340),
    200: Color(0xFF2c164b),
    300: Color(0xFF321956),
    400: Color(0xFF381c61),
    500: Color(0xFF3f206c),
    600: Color(0xFF52367a),
    700: Color(0xFF654c89),
    800: Color(0xFF786298),
    900: Color(0xFFBE9EDC),
    950: Color(0xFFc5bcd2),
    990: Color(0xFFd8d2e1),
  });

  /// Warna sekunder yang digunakan dalam tema aplikasi.
  static MaterialColor secondaryColor = const MaterialColor(0xFFff8f67, {
    100: Color(0xFF7f4733),
    200: Color(0xFF99553d),
    300: Color(0xFFcc7252),
    400: Color(0xFFe5805c),
    500: Color(0xFFff8f67),
    600: Color(0xFFffa585),
    700: Color(0xFFffb094),
    800: Color(0xFFffbba3),
    900: Color(0xFFffc7b3),
    950: Color(0xFFffd2c2),
    990: Color(0xFFffddd1),
  });

  /// Warna yang menunjukkan kesalahan dalam tema aplikasi.
  static MaterialColor errorColor = const MaterialColor(0xFFFF4A4A, {
    100: Color(0xFF4C1616),
    200: Color(0xFF7F2525),
    300: Color(0xFFB23333),
    400: Color(0xFFE54242),
    500: Color(0xFFFF4A4A),
    600: Color(0xFFFF5C5C),
    700: Color(0xFFFF6E6E),
    800: Color(0xFFFF9292),
    900: Color(0xFFFFB6B6),
    950: Color(0xFFFFDADA),
    990: Color(0xFFFFECEC),
  });

  /// Warna yang menunjukkan keberhasilan dalam tema aplikasi.
  static MaterialColor successColor = const MaterialColor(0xFF35B79E, {
    100: Color(0xFF15493F),
    200: Color(0xFF1F6D5E),
    300: Color(0xFF25806E),
    400: Color(0xFF2FA48E),
    500: Color(0xFF35B79E),
    600: Color(0xFF49BEA7),
    700: Color(0xFF5DC5B1),
    800: Color(0xFF85D3C4),
    900: Color(0xFFAEE2D8),
    950: Color(0xFFC2E9E1),
    990: Color(0xFFEAF7f5),
  });

  /// Warna netral yang digunakan dalam tema aplikasi.
  static MaterialColor neutralColor = const MaterialColor(0xFF787579, {
    0: Color(0xFF000000),
    100: Color(0xFF1C1B1F),
    200: Color(0xFF313033),
    300: Color(0xFF484649),
    400: Color(0xFF605D62),
    500: Color(0xFF787579),
    600: Color(0xFF939094),
    700: Color(0xFFAEAAAE),
    800: Color(0xFFC9C5CA),
    900: Color(0xFFE6E1E5),
    950: Color(0xFFF4EFF4),
    990: Color(0xFFFFFBFE),
    1000: Color(0xFFFFFFFF),
  });
}
