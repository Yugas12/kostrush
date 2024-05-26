/// Kelas HttpErrorHandler digunakan untuk menangani kesalahan yang terjadi dalam permintaan HTTP.
class HttpErrorHandler {
  /// Kelas `HttpErrorHandler` adalah kelas utilitas yang bertanggung jawab untuk menangani kesalahan HTTP.
  /// Kelas ini memiliki konstruktor pribadi `_` yang tidak dapat diakses dari luar kelas.
    HttpErrorHandler._();
  

  /// Mengurai respons kesalahan dari data yang diberikan.
  ///
  /// Fungsi ini menerima data yang dapat berupa tipe [Map<String, dynamic>].
  /// Jika data mengandung kunci 'message' dan nilainya adalah tipe [List<dynamic>],
  /// maka fungsi ini akan menggabungkan semua pesan dalam list tersebut
  /// menggunakan karakter pemisah '\n' dan mengembalikan hasilnya.
  /// Jika tidak ada pesan yang ditemukan, fungsi ini akan mengembalikan
  /// string "An unknown error occurred.".
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// dynamic data = {'message': ['Error 1', 'Error 2']};
  /// String errorMessage = parseErrorResponse(data);
  /// print(errorMessage); // Output: "Error 1\nError 2"
  /// ```
  static String parseErrorResponse(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('message')) {
      List<dynamic> messages = data['message'];
      if (messages is List) {
        return messages.join('\n');
      }
    }
    return "An unknown error occurred.";
  }
}
