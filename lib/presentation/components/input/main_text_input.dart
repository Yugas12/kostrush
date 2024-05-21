import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';
import '../focus_node/no_focus_node.dart';

enum MainTextInputValidator { none, email, password, phone, number }

enum MainTextInputBorderStyle { defaultStyle, fullRounded }

/// MainTextInput digunakan untuk membuat input text
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

  /// Membuat validator sesuai dengan MainTextInputValidator
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

  /// Mengembalikan nilai borderRadius sesuai dengan borderStyle
  double _borderRadius() {
    switch (borderStyle) {
      case MainTextInputBorderStyle.fullRounded:
        return 100;
      default:
        return 8;
    }
  }

  /// Membuat prefixIcon sesuai dengan prefixIcon atau prefixWidget
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

  /// Membuat suffixIcon sesuai dengan suffixIcon atau suffixWidget
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

  /// Membuat TextFormField sesuai dengan parameter yang diberikan
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
