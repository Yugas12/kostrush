import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

/// Kelas model yang merepresentasikan permintaan masuk (sign in) pengguna.
@JsonSerializable()
class SignInRequest {
  final String email;
  final String password;

  /// Konstruktor untuk membuat objek SignInRequest.
  ///
  /// [email] adalah alamat email pengguna.
  /// [password] adalah kata sandi pengguna.
  SignInRequest({
    required this.email,
    required this.password,
  });

  /// Membuat objek SignInRequest dari JSON.
  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  /// Mengubah objek SignInRequest menjadi JSON.
  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
