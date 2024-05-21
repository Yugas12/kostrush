import 'package:intl/intl.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [int]
extension IntExtensions on int {
  /// Mengubah [int] menjadi format Rupiah
  String toRupiah() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = "Rp ${formatCurrency.format(this).substring(3)}";

    return formattedCurrency.substring(0, formattedCurrency.indexOf(','));
  }
}
