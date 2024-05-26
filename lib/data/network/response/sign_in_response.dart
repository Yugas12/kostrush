import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

part 'sign_in_response.g.dart';

/// Kelas model untuk respons sign in.
@JsonSerializable()
class SignInResponse {
  final ProfileResponse? user;
  final String? token;

  /// Konstruktor kelas SignInResponse.
  SignInResponse({
    this.token,
    this.user,
  });

  /// Membuat instance SignInResponse dari JSON.
  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  /// Mengubah instance SignInResponse menjadi JSON.
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
