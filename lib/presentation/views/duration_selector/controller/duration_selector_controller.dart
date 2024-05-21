import 'package:get/get.dart';
import 'package:kostrushapp/presentation/views/duration_selector/argument/duration_selector_argument.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class DurationSelectorController
    extends BaseController<DurationSelectorArgument, NoState> {
  Rxn<DurationItem> selectedDuration = Rxn<DurationItem>();

  List<DurationItem> durations = [
    DurationItem(duration: "1 Bulan", value: 1),
    DurationItem(duration: "2 Bulan", value: 2),
    DurationItem(duration: "3 Bulan", value: 3),
  ];

  @override
  void initComponent() {
    logger.d("Arguments retrieved ${arguments.toString()}");
    logger.d("Arguments retrieved ${arguments.duration?.value}");

    if (arguments.duration != null) {
      selectedDuration.value = durations
          .where((element) => element.value == arguments.duration?.value)
          .first;
    }
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    selectedDuration.value = null;
    selectedDuration.close();
  }

  void selectItem(int index) {
    selectedDuration.value = durations[index];
    backWithData();
  }

  void backWithData() {
    Get.back(
        result: DurationSelectorArgument(duration: selectedDuration.value));
  }
}
