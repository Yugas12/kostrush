import 'package:kostrushapp/base/base_argument.dart';

/// Kelas yang merepresentasikan argumen untuk halaman formulir pemesanan.
class OrderFormArgument extends BaseArguments {
  /// ID dari kost yang akan dipesan.
  final int kostId;

  /// ID dari kamar yang akan dipesan.
  final int roomId;

  /// Konstruktor untuk membuat objek OrderFormArgument.
  OrderFormArgument({
    required this.kostId,
    required this.roomId,
  });
}
