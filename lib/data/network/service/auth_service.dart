import 'package:dio/dio.dart' hide Headers;
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/request/sign_in_request.dart';
import 'package:kostrushapp/data/network/request/sign_up_request.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

import '../response/sign_in_response.dart';

part 'auth_service.g.dart';

/// Layanan yang bertanggung jawab untuk mengelola autentikasi pengguna.
@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  /// Mengirim permintaan login ke server.
  ///
  /// [cancelToken] - Token pembatalan yang digunakan untuk membatalkan permintaan.
  /// [request] - Data permintaan login.
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] dengan [SignInResponse].
  @POST('/api/login')
  Future<BaseResponse<SignInResponse>> signIn({
    @CancelRequest() CancelToken? cancelToken,
    @Body() SignInRequest? request,
  });

  /// Mengirim permintaan logout ke server.
  ///
  /// [cancelToken] - Token pembatalan yang digunakan untuk membatalkan permintaan (wajib).
  /// [token] - Token otentikasi yang digunakan untuk mengidentifikasi pengguna yang sedang login (wajib).
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse].
  @DELETE('/api/logout')
  Future<BaseResponse> signOut({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
  });

  /// Mengirim permintaan registrasi ke server.
  ///
  /// [cancelToken] - Token pembatalan yang digunakan untuk membatalkan permintaan (wajib).
  /// [request] - Data permintaan registrasi (wajib).
  ///
  /// Mengembalikan [Future] yang berisi [BaseResponse] dengan [ProfileResponse].
  @POST('/api/register')
  Future<BaseResponse<ProfileResponse>> signUp({
    @CancelRequest() required CancelToken? cancelToken,
    @Body() required SignUpRequest request,
  });
}
