import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../data/local/share_pref/storage_preference.dart';
import '../../data/network/request/transaction_request.dart';
import '../../data/network/response/transaction_response.dart';
import '../../data/network/service/transaction_service.dart';
import '../../res/local_data/storage_constant.dart';

class TransactionRepository {
  TransactionRepository(this._service, this._storage);

  final TransactionService _service;
  final StoragePreference _storage;

  final CancelToken _cancelToken = CancelToken();

  Future<Either<DioException, List<TransactionResponse>>>
      getTransactions() async {
    try {
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      final response = await _service.getTransaction(
        cancelToken: _cancelToken,
        token: "Bearer $token",
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, TransactionResponse>> getTransactionById(
      int id) async {
    try {
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      final response = await _service.getTransactionById(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        id: id,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, TransactionResponse>> createTransaction({
    required int kostId,
    required int price,
    required DateTime date,
    required int duration,
    required File image,
  }) async {
    try {
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      final response = await _service.createTransaction(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        request: TransactionRequest(
          kostId: kostId,
          roomId: 7,
          total: price,
          checkIn: date,
          duration: duration,
        ),
      );

      final responseUpload = await _service.uploadDocument(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        file: image,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
