import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/local/dao/profile_dao.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/model/dashboard_model.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/service/kost_service.dart';
import 'package:kostrushapp/data/network/service/profile_service.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';
import 'package:logger/logger.dart';

import '../../data/network/response/kost_response.dart';

/// Kelas MainRepository adalah kelas yang bertanggung jawab untuk mengelola data dari berbagai sumber.
class MainRepository {
  MainRepository(
    this._kostService,
    this._profileService,
    this._storage,
    this._profileDao,
  );


  final logger = Get.find<Logger>();

  final ProfileService _profileService;
  final KostService _kostService;
  final StoragePreference _storage;

  /// Untuk mengakses data profile dari local database
  final ProfileDao _profileDao;

  /// Untuk membatalkan request
  final CancelToken _cancelToken = CancelToken();

  /// Mengambil data profile dari server dan menyimpannya ke local database.
  /// Mengembalikan data profile yang berhasil disimpan ke local database.
  /// Jika terjadi kesalahan, mengembalikan Exception.
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

      /// Mengembalikan data profile dari local database
      return Right(localData!);
    } on Exception catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mengambil data dashboard dari server.
  /// Fungsi ini akan mengambil data kost yang direkomendasikan dan data kost yang murah dari server.
  /// Jika berhasil, fungsi akan mengembalikan objek [DashboardModel] yang berisi data kost yang direkomendasikan dan data kost yang murah.
  /// Jika terjadi [DioException], fungsi akan mengembalikan objek [Left] yang berisi [DioException].
  Future<Either<DioException, DashboardModel>> getDashboard() async {
    try {
      /// Mengambil data kost yang direkomendasikan dari server
      final recommendedKost =
          await _kostService.getKost(cancelToken: _cancelToken);

      /// Mengambil data kost yang murah dari server
      final cheapKost =
          await _kostService.getKost(cancelToken: _cancelToken);

      /// Mengembalikan objek [DashboardModel] jika permintaan berhasil
      return Right(DashboardModel(
        recommendedKost: recommendedKost.data ?? [],
        cheapKost: cheapKost.data ?? [],
      ));
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mengambil daftar kost yang direkomendasikan dari server.
  ///
  /// Fungsi ini akan mengirim permintaan ke server untuk mendapatkan daftar kost yang direkomendasikan.
  /// Jika permintaan berhasil, fungsi akan mengembalikan daftar kost dalam bentuk `List<KostResponse>`.
  /// Jika terjadi kesalahan saat mengirim permintaan, fungsi akan mengembalikan `DioException`.
  Future<Either<DioException, List<KostResponse>>> getRecommendedKost() async {
    try {
      /// Mengambil data kost dari server
      final response = await _kostService.getKost(cancelToken: _cancelToken);

      /// Mengembalikan daftar kost jika permintaan berhasil
      return Right(response.data!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Mengambil daftar kost dengan harga murah dari server.
  ///
  /// Mengembalikan daftar kost dengan harga murah jika permintaan berhasil.
  /// Jika terjadi kesalahan, mengembalikan [DioException].
  Future<Either<DioException, List<KostResponse>>> getCheapKost() async {
    try {
      final response = await _kostService.getKost(
        cancelToken: _cancelToken,
      );
      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
