import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/dto/transaction_dto.dart';

import '../../data/local/share_pref/storage_preference.dart';
import '../../data/network/request/transaction_request.dart';
import '../../data/network/response/transaction_response.dart';
import '../../data/network/service/transaction_service.dart';
import '../../res/local_data/storage_constant.dart';

/// Kelas yang bertanggung jawab untuk mengelola data transaksi.
class TransactionRepository {
  TransactionRepository(this._service, this._storage);

  final TransactionService _service;
  final StoragePreference _storage;

  /// Untuk membatalkan request
  final CancelToken _cancelToken = CancelToken();

  /// Mengambil daftar transaksi dari server.
  ///
  /// Fungsi ini akan mengambil daftar transaksi dari server menggunakan token sesi yang tersimpan.
  /// Jika berhasil, fungsi akan mengembalikan daftar transaksi dalam bentuk `List<TransactionResponse>`.
  /// Jika terjadi kesalahan, fungsi akan mengembalikan `DioException`.
  Future<Either<DioException, List<TransactionDto>>>
      getTransactions() async {
    try {
      /// Mengambil token dari SharedPreference
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengambil daftar transaksi dari server
      final response = await _service.getTransaction(
        cancelToken: _cancelToken,
        token: "Bearer $token",
      );

      final data = response.data?.map((e) => TransactionDto.fromResponse(e)).toList();

      /// Mengembalikan daftar transaksi jika permintaan berhasil
      return Right(data!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mengambil transaksi berdasarkan ID.
  ///
  /// Fungsi ini mengambil transaksi dari server berdasarkan ID yang diberikan.
  /// Fungsi ini mengembalikan objek [TransactionResponse] jika berhasil,
  /// atau [DioException] jika terjadi kesalahan.
  ///
  /// Parameter:
  /// - [id]: ID transaksi yang ingin diambil.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// final result = await getTransactionById(123);
  /// if (result.isRight()) {
  ///   final transaction = result.getOrElse(() => null);
  ///   // Lakukan sesuatu dengan transaksi
  /// } else {
  ///   final error = result.fold((e) => e, (_) => null);
  ///   // Tangani kesalahan
  /// }
  /// ```
  Future<Either<DioException, TransactionDto>> getTransactionById(
      int id) async {
    try {
      /// Mengambil token dari SharedPreference
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mendapatkan transaksi berdasarkan ID
      final response = await _service.getTransactionById(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        id: id,
      );

      /// Mengembalikan response dari server
      return Right(TransactionDto.fromResponse(response.data!));
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Membuat transaksi baru dengan parameter yang diberikan.
  ///
  /// [kostId] adalah ID dari kost yang akan dibuat transaksi.
  /// [roomId] adalah ID dari kamar yang akan dibuat transaksi.
  /// [price] adalah harga total transaksi.
  /// [date] adalah tanggal check-in transaksi.
  /// [duration] adalah durasi transaksi dalam hari.
  /// [image] adalah file gambar yang akan diunggah.
  ///
  /// Mengembalikan `Future<Either<DioException, TransactionResponse>>` yang berisi hasil transaksi yang berhasil dibuat.
  /// Jika terjadi error, akan mengembalikan `Left` dengan `DioException` yang terjadi.
  Future<Either<DioException, TransactionDto>> createTransaction({
    required int kostId,
    required int roomId,
    required int price,
    required DateTime date,
    required int duration,
    required File image,
  }) async {
    try {
      /// Mengambil token dari SharedPreference
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk membuat transaksi
      final response = await _service.createTransaction(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        request: TransactionRequest(
          kostId: kostId,
          roomId: roomId,
          total: price,
          checkIn: date,
          duration: duration,
        ),
      );

      /// Mengunggah gambar ke server
      await _service.uploadDocument(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        file: image,
      );

      /// Mengembalikan response dari server
      return Right(TransactionDto.fromResponse(response.data!));
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }
}
