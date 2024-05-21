import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/local/dao/profile_dao.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/model/dashboard_model.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/service/kost_service.dart';
import 'package:kostrushapp/data/network/service/profile_service.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';

import '../../data/network/response/kost_response.dart';

class MainRepository {
  MainRepository(
    this._kostService,
    this._profileService,
    this._storage,
    this._profileDao,
  );

  final ProfileService _profileService;
  final KostService _kostService;
  final StoragePreference _storage;
  final ProfileDao _profileDao;

  final CancelToken _cancelToken = CancelToken();

  Future<Either<Exception, ProfileModel>> getProfile() async {
    try {
      /// Mengabil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mendapatkan data profile
      final response = await _profileService
          .getProfile(
        cancelToken: _cancelToken,
        token: "Bearer $token",
      )
          .catchError((e) {
        throw Exception(e);
      });

      final data = response.data;

      /// Menyimpan data profile ke local database
      await _profileDao.insertProfile(
        ProfileModel(
          id: 1,
          name: data?.name ?? "",
          email: data?.email ?? "",
          address: data?.address ?? "",
          phoneNumber: data?.phoneNumber ?? "",
          dateBirth: data?.dateBirth,
          gender: data?.gender?.value,
          occupation: data?.occupation ?? "",
        ),
      );

      /// Mengambil data profile dari local database
      final localData = await _profileDao.getProfile().catchError((e) {
        throw Exception(e);
      });

      return Right(localData!);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, DashboardModel>> getDashboard() async {
    try {
      /// Mengambil data kost dari server
      final recommendedKost =
          await _kostService.getKost(cancelToken: _cancelToken).catchError((e) {
        throw Exception(e);
      });

      /// Mengambil data kost dari server
      final cheapKost =
          await _kostService.getKost(cancelToken: _cancelToken).catchError((e) {
        throw Exception(e);
      });

      return Right(DashboardModel(
        recommendedKost: recommendedKost.data ?? [],
        cheapKost: cheapKost.data ?? [],
      ));
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, List<KostResponse>>> getRecommendedKost() async {
    try {
      /// Mengambil data kost dari server
      final response = await _kostService
          .getKost(
        cancelToken: _cancelToken,
      )
          .catchError((e) {
        throw Exception(e);
      });

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, List<KostResponse>>> getCheapKost() async {
    try {
      /// Mengambil data kost dari server
      final response = await _kostService
          .getKost(
        cancelToken: _cancelToken,
      )
          .catchError((e) {
        throw Exception(e);
      });

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
