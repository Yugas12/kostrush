import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/input/main_text_input.dart';

import '../../themes/color_theme.dart';

/// Widget yang mewakili AppBar dengan fungsi pencarian.
/// Kelas ini merupakan turunan dari StatelessWidget dan mengimplementasikan PreferredSizeWidget.
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged, onSubmitted;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsTheme.primaryColor[800],
      centerTitle: true,
      title: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MainTextInput(
            backgroundColor: ColorsTheme.neutralColor[1000],
            hintText: "Cari Kost",
            controller: controller,
            focusNode: focusNode,
            filled: true,
            borderStyle: MainTextInputBorderStyle.fullRounded,
            prefixIcon: Icon(
              Icons.search,
              color: ColorsTheme.primaryColor,
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          )),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 56);
}
