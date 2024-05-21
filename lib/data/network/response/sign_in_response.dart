import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  final ProfileResponse? user;
  final String? token;

  SignInResponse({
    this.token,
    this.user,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
