import 'package:intl/intl.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [int]
extension IntExtensions on int {
  /// Mengonversi bilangan bulat menjadi format mata uang Rupiah.
  /// 
  /// Fungsi ini akan mengonversi bilangan bulat menjadi format mata uang Rupiah
  /// dengan menggunakan tanda "Rp" di depan angka dan menghilangkan tanda koma.
  /// 
  /// Contoh penggunaan:
  /// 
  /// ```dart
  /// int harga = 10000;
  /// String hargaRupiah = harga.toRupiah(); // Rp 10.000
  /// ```
  String toRupiah() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = "Rp ${formatCurrency.format(this).substring(3)}";

    return formattedCurrency.substring(0, formattedCurrency.indexOf(','));
  }
}
