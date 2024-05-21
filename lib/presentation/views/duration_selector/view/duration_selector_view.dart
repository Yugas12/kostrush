import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/duration_selector_controller.dart';

class DurationSelectorView extends BaseView<DurationSelectorController> {
  const DurationSelectorView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Pilih Durasi Kost",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: controller.durations.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return gap(8);
      },
      itemBuilder: (context, index) {
        final duration = controller.durations[index];
        return InkWell(
          onTap: () {
            controller.selectItem(index);
          },
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Obx(
            () => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: controller.selectedDuration.value == duration
                      ? Colors.transparent
                      : ColorsTheme.primaryColor[800]!,
                  width: 2,
                ),
                color: controller.selectedDuration.value == duration
                    ? ColorsTheme.primaryColor[800]!
                    : Colors.transparent,
              ),
              child: Text(
                duration.duration,
                style: TypographyTheme.labelMedium.copyWith(
                  color: controller.selectedDuration.value == duration
                      ? Colors.white
                      : ColorsTheme.primaryColor[800],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
