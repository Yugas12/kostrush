import 'package:kostrushapp/base/base_argument.dart';

/// Kelas [DurationSelectorArgument] digunakan untuk mengirim argumen ke halaman [DurationSelector].
/// Argumen ini berisi informasi tentang durasi yang dipilih.
class DurationSelectorArgument extends BaseArguments {
  final DurationItem? duration;

  DurationSelectorArgument({required this.duration});
}

/// Kelas [DurationItem] digunakan untuk merepresentasikan item durasi.
/// Setiap item memiliki properti [duration] yang merupakan deskripsi durasi
/// dan properti [value] yang merupakan nilai durasi.
class DurationItem {
  final String duration;
  final int value;

  DurationItem({required this.duration, required this.value});
}
