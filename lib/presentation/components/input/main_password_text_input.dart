import 'package:flutter/material.dart';

import '../../themes/color_theme.dart';
import 'main_text_input.dart';

/// MainPasswordTextInput digunakan untuk membuat input password
class MainPasswordTextInput extends StatefulWidget {
  const MainPasswordTextInput({
    super.key,
    required this.controller,
    this.label = "Kata Sandi",
    this.borderStyle = MainTextInputBorderStyle.defaultStyle,
  });

  final TextEditingController controller;
  final String? label;
  final MainTextInputBorderStyle borderStyle;

  @override
  State<MainPasswordTextInput> createState() => _MainPasswordTextInputState();
}

class _MainPasswordTextInputState extends State<MainPasswordTextInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MainTextInput(
      controller: widget.controller,
      label: widget.label,
      borderStyle: widget.borderStyle,
      inputType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      validator: MainTextInputValidator.password,
      suffixIcon: !_obscureText
          ? Icon(
              Icons.visibility,
              color: ColorsTheme.neutralColor[800],
            )
          : Icon(
              Icons.visibility_off,
              color: ColorsTheme.neutralColor[800],
            ),
      onTapSuffix: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _obscureText = true;
  }
}
