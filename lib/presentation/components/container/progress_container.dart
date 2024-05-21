import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_container.dart';

/// Class ini digunakan untuk membuat container progress
class ProgressContainer extends StatelessWidget {
  final void Function()? onDismiss;
  final Widget? customWidget;
  final bool isShow;

  const ProgressContainer({
    super.key,
    this.onDismiss,
    this.isShow = false,
    this.customWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isShow ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      child: isShow
          ? GestureDetector(
              onTap: onDismiss,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.white.withOpacity(1),
                  child: customWidget ?? const LoadingContainer(),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
