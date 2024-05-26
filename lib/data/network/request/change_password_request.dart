import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

/// Kelas ini digunakan untuk merepresentasikan permintaan perubahan password.
@JsonSerializable()
class ChangePasswordRequest {
  final String password;

  /// Konstruktor untuk membuat objek ChangePasswordRequest.
  ChangePasswordRequest({
    required this.password,
  });

  /// Membuat objek ChangePasswordRequest dari JSON.
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  /// Mengubah objek ChangePasswordRequest menjadi JSON.
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
