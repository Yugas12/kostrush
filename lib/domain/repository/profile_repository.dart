import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kostrushapp/data/dto/profile_dto.dart';
import 'package:kostrushapp/data/enum/gender_enum.dart';
import 'package:kostrushapp/data/local/dao/profile_dao.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/network/request/change_password_request.dart';
import 'package:kostrushapp/data/network/request/update_profile_request.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';

import '../../data/model/profile_model.dart';
import '../../data/network/response/profile_response.dart';
import '../../data/network/service/profile_service.dart';

/// Kelas `ProfileRepository` adalah kelas yang bertanggung jawab untuk mengelola data profil pengguna.
class ProfileRepository {
  ProfileRepository(this._service, this._storage, this._profileDao);

  final ProfileService _service;
  final StoragePreference _storage;
  final ProfileDao _profileDao;

  /// Untuk membatalkan request
  final CancelToken _cancelToken = CancelToken();

  /// Mengambil data profile dari server dan menyimpannya ke local database.
  /// Jika terjadi kesalahan, akan mengembalikan [Left] dengan [Exception].
  /// Jika berhasil, akan mengembalikan [Right] dengan [ProfileModel].
  Future<Either<Exception, ProfileModel>> getProfile() async {
    try {
      /// Mengambil token dari SharedPreference
      /// Jika token tidak ada maka akan mengembalikan nilai null
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mendapatkan data profile
      final response = await _service
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

  /// Mengupdate profil pengguna dengan informasi yang diberikan.
  ///
  /// Parameter:
  /// - [name]: Nama pengguna yang akan diupdate.
  /// - [email]: Email pengguna yang akan diupdate.
  /// - [address]: Alamat pengguna yang akan diupdate.
  /// - [phoneNumber]: Nomor telepon pengguna yang akan diupdate.
  /// - [occupation]: Pekerjaan pengguna yang akan diupdate.
  ///
  /// Mengembalikan [Future] yang berisi [Either] dari [DioException] dan [ProfileResponse].
  /// Jika update berhasil, akan mengembalikan [Right] dengan data profil yang diperbarui.
  /// Jika terjadi [DioException], akan mengembalikan [Left] dengan exception yang terjadi.
  Future<Either<DioException, ProfileDto>> updateProfile({
    required String name,
    required String email,
    required String address,
    required String phoneNumber,
    required String occupation,
  }) async {
    try {
      /// Mengambil token dari SharedPreference
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mengupdate profil pengguna
      final response = await _service.updateProfile(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        request: UpdateProfileRequest(
          name: name,
          email: email,
          phone: phoneNumber,
          address: address,
          occupation: occupation,
          // TODO: Add date
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

  /// Mengubah password pengguna.
  ///
  /// Metode ini mengirim permintaan ke server untuk mengubah password pengguna.
  /// Metode ini mengembalikan objek [Future] yang berisi [Either] dari [DioException] dan [ProfileResponse].
  /// Jika permintaan berhasil, objek [ProfileResponse] akan dikembalikan dalam [Right].
  /// Jika terjadi kesalahan, [DioException] akan dikembalikan dalam [Left].
  ///
  /// Parameter:
  /// - [password]: Password baru yang akan diubah.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// final result = await profileRepository.changePassword(password: "new_password");
  /// result.fold(
  ///   (error) => print("Terjadi kesalahan: $error"),
  ///   (response) => print("Password berhasil diubah: $response"),
  /// );
  /// ```
  Future<Either<DioException, ProfileDto>> changePassword({
    required String password,
  }) async {
    try {
      /// Mengambil token dari SharedPreference
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      /// Mengirim request ke server untuk mengubah password
      final response = await _service.changePassword(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        request: ChangePasswordRequest(password: password),
      );

      /// Mengembalikan response dari server
      return Right(ProfileDto.fromResponse(response.data!));
    } on DioException catch (e) {
      /// Mengembalikan exception jika terjadi kesalahan
      return Left(e);
    }
  }
}
