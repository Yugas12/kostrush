import 'package:dio/dio.dart';
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/request/change_password_request.dart';
import 'package:kostrushapp/data/network/request/update_profile_request.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

/// Layanan untuk mengakses profil pengguna.
@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

  /// Mendapatkan profil pengguna.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses profil.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] dengan [ProfileResponse].
  @GET('/api/user/profile')
  Future<BaseResponse<ProfileResponse>> getProfile({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
  });

  /// Memperbarui profil pengguna.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses profil.
  /// [request] - Data permintaan untuk memperbarui profil.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] dengan [ProfileResponse].
  @PUT('/api/user/profile')
  Future<BaseResponse<ProfileResponse>> updateProfile({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Body() required UpdateProfileRequest request,
  });

  /// Mengubah kata sandi pengguna.
  ///
  /// [cancelToken] - Token pembatalan untuk membatalkan permintaan.
  /// [token] - Token otorisasi yang diperlukan untuk mengakses profil.
  /// [request] - Data permintaan untuk mengubah kata sandi.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] dengan [ProfileResponse].
  @PUT('/api/user/change-password')
  Future<BaseResponse<ProfileResponse>> changePassword({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Body() required ChangePasswordRequest request,
  });
}
