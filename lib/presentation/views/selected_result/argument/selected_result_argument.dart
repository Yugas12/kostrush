import 'package:kostrushapp/base/base_argument.dart';

/// Kelas `SelectedResultArgument` adalah turunan dari kelas `BaseArguments`.
/// Digunakan untuk menyimpan argumen yang diperlukan untuk tampilan hasil terpilih.
class SelectedResultArgument extends BaseArguments {
  final SelectedResultContext context;

  SelectedResultArgument(this.context);
}

/// Enum yang merepresentasikan konteks hasil terpilih.
enum SelectedResultContext {
  popularDormitory,
  cheapDormitory,
}
