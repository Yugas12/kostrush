import 'package:kostrushapp/base/base_argument.dart';

/// Kelas DetailTransactionArgument digunakan untuk menyimpan argumen yang diperlukan
/// saat membuka halaman detail transaksi.
class DetailTransactionArgument extends BaseArguments {
  final int id;

  /// Konstruktor DetailTransactionArgument digunakan untuk menginisialisasi objek
  /// dengan nilai id yang diberikan.
  DetailTransactionArgument({
    required this.id,
  });
}
