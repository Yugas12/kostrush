import 'package:kostrushapp/base/base_argument.dart';

/// Kelas DetailDormitoryArgument adalah kelas argumen yang digunakan untuk mengirim data ID ke halaman Detail Dormitory.
class DetailDormitoryArgument extends BaseArguments {
  final int id;

  /// Konstruktor kelas DetailDormitoryArgument.
  ///
  /// [id] adalah ID dari dormitory yang akan ditampilkan di halaman Detail Dormitory.
  DetailDormitoryArgument(this.id);
}
