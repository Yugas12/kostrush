import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/network/service/kost_service.dart';

import '../../data/network/response/kost_response.dart';

class KostRepository {
  KostRepository(this._kostService, this._storage);

  final KostService _kostService;
  final StoragePreference _storage;

  final CancelToken _cancelToken = CancelToken();

  Future<Either<DioException, List<KostResponse>>> getKosts() async {
    try {
      final response = await _kostService.getKost(
        cancelToken: _cancelToken,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, KostResponse>> getKostById(int id) async {
    try {
      final response = await _kostService.getKostById(
        cancelToken: _cancelToken,
        id: id,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, List<KostResponse>>> getKostBySubLocality(
      String subLocality) async {
    try {
      final response = await _kostService.getKostBySubLocality(
        cancelToken: _cancelToken,
        query: subLocality,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, List<KostResponse>>> searchKost(
      String query) async {
    try {
      final response = await _kostService.searchKost(
        cancelToken: _cancelToken,
        query: query,
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
