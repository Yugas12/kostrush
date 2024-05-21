import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

class ProfileRepository {
  ProfileRepository(this._service, this._storage, this._profileDao);

  final ProfileService _service;
  final StoragePreference _storage;
  final ProfileDao _profileDao;

  final CancelToken _cancelToken = CancelToken();

  Future<Either<Exception, ProfileModel>> getProfile() async {
    try {
      /// Mengabil token dari SharedPreference
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

      return Right(localData!);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, ProfileResponse>> updateProfile({
    required String name,
    required String email,
    required String address,
    required String phoneNumber,
    required String occupation,
  }) async {
    try {
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

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

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }

  Future<Either<DioException, ProfileResponse>> changePassword({
    required String password,
  }) async {
    try {
      final token = await _storage.readSecureData(StorageConstant.sessionToken);

      final response = await _service.changePassword(
        cancelToken: _cancelToken,
        token: "Bearer $token",
        request: ChangePasswordRequest(password: password),
      );

      return Right(response.data!);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
