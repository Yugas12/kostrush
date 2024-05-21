import 'package:kostrushapp/base/base_argument.dart';

class SelectedResultArgument extends BaseArguments {
  final SelectedResultContext context;

  SelectedResultArgument(this.context);
}

enum SelectedResultContext {
  popularDormitory,
  cheapDormitory,
}
