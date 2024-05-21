import 'package:flutter/material.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';

enum TagChipType {
  filled,
  outlined,
}

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
