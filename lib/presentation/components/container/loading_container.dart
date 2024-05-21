import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';

/// Class ini digunakan untuk membuat container loading
class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              border: Border.all(
                // TODO: Change the color of the border
                color: Colors.white,
                width: 0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  160,
                ),
              ),
            ),
            child: CircularProgressIndicator(
              // TODO: Change the color of the CircularProgressIndicator
              color: ColorsTheme.primaryColor,
              strokeCap: StrokeCap.round,
              strokeWidth: 8,
            ),
          ),
        ),
      ],
    );
  }
}
