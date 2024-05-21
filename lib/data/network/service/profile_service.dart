import 'package:dio/dio.dart';
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/request/change_password_request.dart';
import 'package:kostrushapp/data/network/request/update_profile_request.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

  @GET('/api/user/profile')
  Future<BaseResponse<ProfileResponse>> getProfile({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
  });

  @PUT('/api/user/profile')
  Future<BaseResponse<ProfileResponse>> updateProfile({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Body() required UpdateProfileRequest request,
  });

  @PUT('/api/user/change-password')
  Future<BaseResponse<ProfileResponse>> changePassword({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
    @Body() required ChangePasswordRequest request,
  });
}
