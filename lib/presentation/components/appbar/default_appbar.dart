import 'package:flutter/material.dart';

import 'base_appbar.dart';

/// Class ini digunakan untuk membuat appbar default
class DefaultAppBar extends BaseAppBar {
  final Function()? onBackPress;
  final String appbarTitle;
  @override
  final List<Widget>? actions;
  @override
  final Widget? prefixWidget;
  @override
  final double? elevation;

  DefaultAppBar({
    super.key,
    this.onBackPress,
    required this.appbarTitle,
    this.actions,
    this.prefixWidget,
    this.elevation,
  }) : super(
          titleWidget: Text(appbarTitle),
          centerTitle: true,
          prefixWidget: prefixWidget ??
              (onBackPress != null
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: onBackPress,
                    )
                  : null),
          actionWidgets: actions,
          appbarElevation: elevation,
        );
}
