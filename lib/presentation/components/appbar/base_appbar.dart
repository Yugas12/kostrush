import 'package:flutter/material.dart';

/// Class ini digunakan untuk membuat appbar yang akan di custom
class BaseAppBar extends AppBar {
  final double? appbarElevation;
  final Widget? prefixWidget, titleWidget;
  final List<Widget>? actionWidgets;
  final PreferredSizeWidget? bottomWidget;

  BaseAppBar({
    super.key,
    this.appbarElevation,
    this.prefixWidget,
    this.titleWidget,
    this.actionWidgets,
    super.backgroundColor,
    bool super.centerTitle = false,
    this.bottomWidget,
  }) : super(
          elevation: appbarElevation,
          leading: prefixWidget,
          title: titleWidget,
          actions: actionWidgets,
          bottom: bottomWidget,
        );
}
