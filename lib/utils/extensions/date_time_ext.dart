import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Mengubah objek DateTime menjadi string dengan format tanggal yang ditentukan.
  /// Format tanggal yang digunakan adalah "EEEE, dd MMMM yyyy" dengan bahasa Indonesia.
  /// 
  /// Contoh penggunaan:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// String formattedDate = now.formatDate();
  /// print(formattedDate); // Output: "Senin, 01 Januari 2022"
  /// ```
  String formatDate() {
    final date = toLocal();
    final formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');

    return formatter.format(date);
  }

  /// Mengubah objek DateTime menjadi string dengan format tanggal saja.
    ///
    /// Metode ini mengubah objek DateTime menjadi string dengan format "dd MMMM yyyy".
    /// Format tanggal yang dihasilkan akan menggunakan bahasa Indonesia (id_ID).
    ///
    /// Contoh penggunaan:
    /// ```dart
    /// DateTime now = DateTime.now();
    /// String formattedDate = now.formatDateOnly();
    /// print(formattedDate); // Output: 01 Januari 2022
    /// ```
    String formatDateOnly() {
      final date = toLocal();
      final formatter = DateFormat('dd MMMM yyyy', 'id_ID');

      return formatter.format(date);
    }

  /// Mengubah waktu menjadi string dengan format HH:mm menggunakan bahasa Indonesia.
  String formatTime() {
    final date = toLocal();
    final formatter = DateFormat('HH:mm', 'id_ID');

    return formatter.format(date);
  }
}
