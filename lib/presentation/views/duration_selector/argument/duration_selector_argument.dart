import 'package:kostrushapp/base/base_argument.dart';

class DurationSelectorArgument extends BaseArguments {
  final DurationItem? duration;

  DurationSelectorArgument({required this.duration});
}

class DurationItem {
  final String duration;
  final int value;

  DurationItem({required this.duration, required this.value});
}
