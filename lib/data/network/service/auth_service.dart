import 'package:dio/dio.dart' hide Headers;
import 'package:kostrushapp/base/base_response.dart';
import 'package:kostrushapp/data/network/request/sign_in_request.dart';
import 'package:kostrushapp/data/network/request/sign_up_request.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

import '../response/sign_in_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('/api/login')
  Future<BaseResponse<SignInResponse>> signIn({
    @CancelRequest() CancelToken? cancelToken,
    @Body() SignInRequest? request,
  });

  @DELETE('/api/logout')
  Future<BaseResponse> signOut({
    @CancelRequest() required CancelToken cancelToken,
    @Header('Authorization') required String token,
  });

  @POST('/api/register')
  Future<BaseResponse<ProfileResponse>> signUp({
    @CancelRequest() required CancelToken? cancelToken,
    @Body() required SignUpRequest request,
  });
}
