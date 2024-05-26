import 'package:flutter/material.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';

enum TagChipType {
  filled,
  outlined,
}

/// Widget untuk menampilkan chip tag.
class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.text,
    required this.type,
    this.color,
    this.textStyle,
  });

  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final TagChipType type;

  /// Factory method to create a filled TagChip.
  ///
  /// This factory method creates a TagChip with a filled appearance.
  /// It takes the following parameters:
  /// - `text`: The text to be displayed on the chip.
  /// - `color`: The color of the chip. If not provided, the default color will be used.
  /// - `textStyle`: The style of the text displayed on the chip. If not provided, the default style will be used.
  ///
  /// Example usage:
  /// ```dart
  /// TagChip.filled(
  ///   text: 'Example Tag',
  ///   color: Colors.blue,
  ///   textStyle: TextStyle(fontSize: 16),
  /// );
  /// ```
  factory TagChip.filled({
    required String text,
    Color? color,
    TextStyle? textStyle,
  }) {
    return TagChip(
      text: text,
      color: color,
      textStyle: textStyle,
      type: TagChipType.filled,
    );
  }

  /// Factory method untuk membuat TagChip dengan gaya outlined.
  ///
  /// Parameter:
  /// - `text` (String): Teks yang akan ditampilkan pada TagChip.
  /// - `color` (Color, opsional): Warna latar belakang TagChip.
  /// - `textStyle` (TextStyle, opsional): Gaya teks untuk TagChip.
  ///
  /// Mengembalikan instance TagChip dengan gaya outlined.
  factory TagChip.outlined({
    required String text,
    Color? color,
    TextStyle? textStyle,
  }) {
    return TagChip(
      text: text,
      color: color,
      textStyle: textStyle,
      type: TagChipType.outlined,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFilled();
  }

  /// Widget untuk membangun chip dengan tampilan yang terisi.
  Widget _buildFilled() {
    return Container(
      decoration: BoxDecoration(
        color: color ?? ColorsTheme.secondaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: Text(
          text,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: ColorsTheme.neutralColor[1000],
              ),
        ),
      ),
    );
  }

  /// Widget untuk membangun Chip dengan border.
  ///
  /// Widget ini mengembalikan sebuah Container dengan dekorasi border,
  /// padding, dan teks yang ditengah.
  ///
  /// Parameter:
  /// - `color`: Warna border. Jika tidak ditentukan, akan menggunakan
  ///   ColorsTheme.secondaryColor sebagai default.
  /// - `text`: Teks yang ditampilkan di dalam Chip.
  /// - `textStyle`: Gaya teks. Jika tidak ditentukan, akan menggunakan
  ///   TypographyTheme.labelMedium dengan warna yang sama dengan border.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// Widget chip = _buildOutlined(
  ///   color: Colors.red,
  ///   text: 'Tag 1',
  ///   textStyle: TextStyle(fontSize: 16),
  /// );
  /// ```
  Widget _buildOutlined() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color ?? ColorsTheme.secondaryColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: Text(
          text,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.secondaryColor,
              ),
        ),
      ),
    );
  }
}
