import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/dto/profile_dto.dart';
import 'package:kostrushapp/data/enum/gender_enum.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:kostrushapp/data/network/service/auth_service.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';

import '../../data/local/dao/profile_dao.dart';
import '../../data/network/request/sign_in_request.dart';
import '../../data/network/request/sign_up_request.dart';

/// Kelas `AuthRepository` adalah sebuah repository yang bertanggung jawab untuk mengelola autentikasi pengguna.
class AuthRepository {
  AuthRepository(this._service, this._storage, this._profileDao);

  final AuthService _service;
  final StoragePreference _storage;
  final ProfileDao _profileDao;

  // Untuk membatalkan request
  final CancelToken _cancelToken = CancelToken();

  /// Fungsi ini digunakan untuk melakukan proses sign in.
  ///
  /// [email] adalah parameter wajib berupa String yang merupakan email pengguna.
  /// [password] adalah parameter wajib berupa String yang merupakan password pengguna.
  ///
  /// Fungsi ini akan mengirimkan request ke server untuk melakukan sign in.
  /// Jika sign in berhasil, token akan disimpan ke SharedPreference.
  /// Selain itu, data profile juga akan disimpan ke local database.
  /// Fungsi ini akan mengembalikan data profile dari local database jika sign in berhasil,
  /// atau mengembalikan DioException jika terjadi error.
  Future<Either<DioException, ProfileModel>> signIn(
      {required String email, required String password}) async {
    try {
      /// Mengirim request ke server untuk sign in
      final response = await _service.signIn(
        cancelToken: _cancelToken,
        request: SignInRequest(
          email: email,
          password: password,
        ),
      );

      /// Menyimpan token ke SharedPreference
      await _storage.writeSecureData(
          StorageConstant.sessionToken, response.data?.token ?? "");

      /// Menyimpan data profile ke local database
      await _profileDao.insertProfile(
        ProfileModel(
          id: 1,
          name: response.data?.user?.name ?? "",
          email: response.data?.user?.email ?? "",
          address: response.data?.user?.address ?? "",
          phoneNumber: response.data?.user?.phoneNumber ?? "",
          dateBirth: response.data?.user?.dateBirth,
          occupation: response.data?.user?.occupation ?? "",
          gender: response.data?.user?.gender?.value,
        ),
      );

      /// Mengambil data profile dari local database
      final localData = await _profileDao.getProfile().catchError((e) {
        throw Exception(e);
      });

      /// Mengembalikan data profile dari local database
      return Right(localData!);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }

  /// Fungsi untuk melakukan proses sign out.
  /// Mengembalikan `Future` yang berisi `Either` dari `DioException` dan `BaseResponse`.
  Future<Either<DioException, BaseResponse>> signOut() async {
    try {
      /// Mengambil token dari SharedPreference.
      /// Jika token tidak ada, maka akan mengembalikan nilai null.
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk sign out.
      final response = await _service.signOut(
        cancelToken: _cancelToken,
        token: "Bearer $token",
      );

      /// Menghapus token dari SharedPreference.
      await _storage.deleteSecureData(StorageConstant.sessionToken);

      /// Mengembalikan response dari server.
      return Right(response);
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan.
      return Left(e);
    }
  }

  /// Melakukan pendaftaran pengguna baru dengan mengirimkan permintaan ke server.
  ///
  /// Parameter:
  /// - [name]: Nama pengguna.
  /// - [email]: Alamat email pengguna.
  /// - [password]: Kata sandi pengguna.
  /// - [address]: Alamat pengguna.
  /// - [phoneNumber]: Nomor telepon pengguna.
  /// - [occupation]: Pekerjaan pengguna.
  ///
  /// Mengembalikan:
  /// - [Future<Either<DioException, ProfileResponse>>]: Objek Future yang berisi entitas Either yang berisi DioException jika terjadi kesalahan atau ProfileResponse jika pendaftaran berhasil.
  ///
  /// Exception:
  /// - [DioException]: Exception yang terjadi jika terjadi kesalahan saat melakukan permintaan ke server.
  Future<Either<DioException, ProfileDto>> signUp({
    required String name,
    required String email,
    required String password,
    required String address,
    required String phoneNumber,
    required String occupation,
  }) async {
    try {
      /// Mengirim request ke server untuk sign up
      final response = await _service.signUp(
        cancelToken: _cancelToken,
        request: SignUpRequest(
          name: name,
          email: email,
          password: password,
          address: address,
          phone: phoneNumber,
          occupation: occupation,
          dateBirth: DateTime.now(),
          gender: GenderEnum.Male,
        ),
      );

      /// Mengembalikan response dari server
      return Right(ProfileDto.fromResponse(response.data!));
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }
}
