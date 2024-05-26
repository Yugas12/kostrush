import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';
import '../focus_node/no_focus_node.dart';

enum MainTextInputValidator { none, email, password, phone, number }

enum MainTextInputBorderStyle { defaultStyle, fullRounded }

/// Widget untuk input teks utama.
class MainTextInput extends StatelessWidget {
  const MainTextInput({
    super.key,
    required this.controller,
    this.focusNode,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.hintText,
    this.label,
    this.onSubmitted,
    this.onChanged,
    this.autoFill,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
    this.suffixWidget,
    this.inputFormatters,
    this.validator = MainTextInputValidator.none,
    this.borderStyle = MainTextInputBorderStyle.defaultStyle,
    this.backgroundColor,
    this.primaryColor,
    this.onTapPrefix,
    this.onTapSuffix,
    this.obscureText,
    this.enabled,
    this.onTap,
    this.filled,
    this.onContainerTap,
    this.counterText,
    this.counterStyle,
    this.containerHeight,
    this.containerWidth,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final int? maxLines, minLines, maxLength;
  final double? containerHeight, containerWidth;
  final String? hintText;
  final String? label;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Iterable<String>? autoFill;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final Widget? suffixWidget;
  final MainTextInputValidator validator;
  final List<TextInputFormatter>? inputFormatters;
  final MainTextInputBorderStyle borderStyle;
  final Color? backgroundColor;
  final Color? primaryColor;
  final Function()? onTapPrefix, onTapSuffix;
  final bool? obscureText;
  final bool? enabled;
  final bool? filled;
  final VoidCallback? onTap;
  final VoidCallback? onContainerTap;
  final String? counterText;
  final TextStyle? counterStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                style: TypographyTheme.bodyMedium,
              )
            : const SizedBox(),
        const SizedBox(height: 4),
        InkWell(
          onTap: onContainerTap,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          child: SizedBox(
            height: containerHeight,
            width: containerWidth,
            child: _buildTextInput(),
          ),
        ),
      ],
    );
  }

  
  /// Fungsi untuk membangun validator berdasarkan jenis validator yang diberikan.
  /// 
  /// Mengembalikan fungsi yang menerima sebuah nilai dan mengembalikan pesan kesalahan jika nilai tidak valid.
  /// 
  /// Jenis validator yang didukung:
  /// - [MainTextInputValidator.email]: Validator untuk memvalidasi email.
  /// - [MainTextInputValidator.password]: Validator untuk memvalidasi kata sandi.
  /// - [MainTextInputValidator.phone]: Validator untuk memvalidasi nomor telepon.
  /// 
  /// Contoh penggunaan:
  /// ```dart
  /// String? Function(String?) validator = _validatorBuilder();
  /// String? errorMessage = validator('example@example.com');
  /// if (errorMessage != null) {
  ///   print(errorMessage);
  /// }
  /// ```
  String? Function(String?) _validatorBuilder() {
    switch (validator) {
      case MainTextInputValidator.email:
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Email tidak boleh kosong';
          }

          if (!value.isEmail) {
            return 'Email tidak valid';
          }

          return null;
        };

      case MainTextInputValidator.password:
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Kata Sandi tidak boleh kosong';
          }

          if (value.length < 8) {
            return 'Kata Sandi minimal 8 karakter';
          }

          return null;
        };

      case MainTextInputValidator.phone:
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Nomor telepon tidak boleh kosong';
          }

          if (!value.isPhoneNumber) {
            return 'Nomor telepon tidak valid';
          }

          return null;
        };

      default:
        return (_) => null;
    }
  }

  /// Mengembalikan nilai borderRadius sesuai dengan borderStyle yang ditentukan.
  ///
  /// Jika borderStyle adalah MainTextInputBorderStyle.fullRounded, maka nilai yang dikembalikan adalah 100.
  /// Jika tidak, maka nilai yang dikembalikan adalah 8.
  double _borderRadius() {
    switch (borderStyle) {
      case MainTextInputBorderStyle.fullRounded:
        return 100;
      default:
        return 8;
    }
  }

  /// Method untuk membangun widget ikon awalan (_prefixIconBuilder).
  /// Jika [prefixWidget] tidak null, maka akan mengembalikan [prefixWidget].
  /// Jika [prefixIcon] tidak null, maka akan mengembalikan [IconButton] dengan [prefixIcon].
  /// Jika [prefixIcon] null, maka akan mengembalikan null.
  Widget? _prefixIconBuilder() {
    return prefixWidget ??
        (prefixIcon != null
            ? IconButton(
                onPressed: onTapPrefix,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: prefixIcon!,
              )
            : null);
  }

  /// Method untuk membangun widget ikon di sebelah kanan input teks utama.
  ///
  /// Jika [suffixWidget] tidak null, maka akan mengembalikan [suffixWidget].
  /// Jika [suffixIcon] tidak null, maka akan mengembalikan [IconButton] dengan [suffixIcon].
  /// Jika [suffixIcon] null, maka akan mengembalikan null.
  Widget? _suffixIconBuilder() {
    return suffixWidget ??
        (suffixIcon != null
            ? IconButton(
                onPressed: onTapSuffix,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: suffixIcon!,
              )
            : null);
  }

  /// Widget untuk membangun input teks utama.
  ///
  /// Widget ini menggunakan TextFormField untuk menghasilkan input teks dengan berbagai konfigurasi seperti inputFormatters,
  /// showCursor, focusNode, controller, keyboardType, onChanged, obscureText, maxLines, minLines, maxLength, onFieldSubmitted,
  /// cursorColor, autofillHints, validator, enabled, onTap, style, decoration, dan lain-lain.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// Widget _buildTextInput() => TextFormField(
  ///   // konfigurasi input teks
  /// );
  /// ```
  Widget _buildTextInput() => TextFormField(
        inputFormatters: inputFormatters,
        showCursor: true,
        focusNode: focusNode,
        controller: controller,
        keyboardType: inputType,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        onFieldSubmitted: onSubmitted,
        cursorColor: primaryColor ?? ColorsTheme.primaryColor,
        autofillHints: autoFill,
        validator: _validatorBuilder(),
        enabled: focusNode is NoFocusNode ? false : enabled,
        onTap: onTap,
        style: TypographyTheme.bodyMedium.copyWith(
          color: ColorsTheme.neutralColor[100],
        ),
        decoration: InputDecoration(
          prefixIcon: _prefixIconBuilder(),
          suffixIcon: _suffixIconBuilder(),
          counterText: counterText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          hintText: hintText,
          fillColor: backgroundColor ?? ColorsTheme.neutralColor[1000],
          filled: filled,
          hintStyle: TypographyTheme.bodyMedium.copyWith(
            color: ColorsTheme.neutralColor[800],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_borderRadius()),
            gapPadding: 0,
            borderSide: BorderSide(
              color: ColorsTheme.neutralColor[800] ?? Colors.grey,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_borderRadius()),
            borderSide: BorderSide(
              color: ColorsTheme.neutralColor[800] ?? Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_borderRadius()),
            borderSide: BorderSide(
              color: ColorsTheme.primaryColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_borderRadius()),
            borderSide: BorderSide(
              color: ColorsTheme.errorColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_borderRadius()),
            borderSide: BorderSide(
              color: ColorsTheme.neutralColor[800] ?? Colors.grey,
              width: 1,
            ),
          ),
        ),
      );
}
