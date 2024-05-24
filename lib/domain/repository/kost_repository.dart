import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/network/service/kost_service.dart';

import '../../data/network/response/kost_response.dart';

/// Kelas `KostRepository` adalah kelas yang bertanggung jawab untuk mengelola data kost.
class KostRepository {
  KostRepository(this._kostService, this._storage);

  final KostService _kostService;
  final StoragePreference _storage;

  /// Untuk membatalkan request
  final CancelToken _cancelToken = CancelToken();

  /// Mengambil daftar Kost dari server.
  ///
  /// Fungsi ini akan mengirim permintaan ke server untuk mendapatkan daftar Kost.
  /// Jika permintaan berhasil, fungsi akan mengembalikan daftar Kost dalam bentuk `List<KostResponse>`.
  /// Jika terjadi kesalahan saat mengirim permintaan, fungsi akan mengembalikan `DioException`.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// final result = await getKosts();
  /// result.fold(
  ///   (error) => print('Terjadi kesalahan: $error'),
  ///   (kosts) => print('Daftar Kost: $kosts'),
  /// );
  /// ```
  Future<Either<DioException, List<KostResponse>>> getKosts() async {
    try {
      /// Mengirim permintaan ke server untuk mendapatkan daftar Kost
      final response = await _kostService.getKost(
        cancelToken: _cancelToken,
      );

      /// Mengembalikan daftar Kost jika permintaan berhasil
      return Right(response.data!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mengambil data Kost berdasarkan ID.
  ///
  /// Fungsi ini akan mengirimkan permintaan ke [_kostService] untuk mendapatkan data Kost
  /// dengan menggunakan ID yang diberikan. Jika permintaan berhasil, fungsi akan mengembalikan
  /// data Kost dalam bentuk [KostResponse]. Jika terjadi [DioException] selama permintaan,
  /// fungsi akan mengembalikan [Left] dengan [DioException] yang terjadi.
  ///
  /// Parameter:
  /// - [id]: ID Kost yang ingin diambil.
  ///
  /// Mengembalikan:
  /// - [Right] dengan [KostResponse] jika permintaan berhasil.
  /// - [Left] dengan [DioException] jika terjadi [DioException] selama permintaan.
  Future<Either<DioException, KostResponse>> getKostById(int id) async {
    try {
      /// Mengirim permintaan ke server untuk mendapatkan Kost berdasarkan ID
      final response = await _kostService.getKostById(
        cancelToken: _cancelToken,
        id: id,
      );

      /// Mengembalikan data Kost jika permintaan berhasil
      return Right(response.data!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mengambil daftar Kost berdasarkan sub-lokasi.
  ///
  /// Fungsi ini mengambil daftar Kost berdasarkan sub-lokasi yang diberikan.
  /// Jika berhasil, akan mengembalikan daftar Kost dalam bentuk `List<KostResponse>`.
  /// Jika terjadi error, akan mengembalikan `DioException`.
  ///
  /// Parameter:
  /// - `subLocality`: Sub-lokasi yang digunakan sebagai kriteria pencarian.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// final result = await getKostBySubLocality('Jakarta');
  /// if (result.isRight()) {
  ///   final kostList = result.getOrElse(() => []);
  ///   // Lakukan sesuatu dengan daftar Kost
  /// } else {
  ///   final error = result.getLeft();
  ///   // Lakukan sesuatu dengan error
  /// }
  /// ```
  Future<Either<DioException, List<KostResponse>>> getKostBySubLocality(
      String subLocality) async {
    try {
      /// Mengirim permintaan ke server untuk mendapatkan Kost berdasarkan sub-lokasi
      final response = await _kostService.getKostBySubLocality(
        cancelToken: _cancelToken,
        query: subLocality,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mencari daftar kost berdasarkan query.
  ///
  /// Mengembalikan `List<KostResponse>` jika berhasil ditemukan,
  /// atau `DioException` jika terjadi kesalahan.
  Future<Either<DioException, List<KostResponse>>> searchKost(
      String query) async {
    try {
      /// Mengirim permintaan ke server untuk mencari Kost
      final response = await _kostService.searchKost(
        cancelToken: _cancelToken,
        query: query,
      );

      /// Mengembalikan daftar Kost jika permintaan berhasil
      return Right(response.data!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }
}
