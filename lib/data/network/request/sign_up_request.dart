import 'package:json_annotation/json_annotation.dart';

import '../../enum/gender_enum.dart';

part 'sign_up_request.g.dart';

/// Kelas model yang merepresentasikan data permintaan pendaftaran pengguna baru.
@JsonSerializable()
class SignUpRequest {
  final String email;
  final String password;
  final String name;
  @JsonKey(name: 'no_hp')
  final String phone;
  @JsonKey(name: 'alamat')
  final String address;
  @JsonKey(name: 'pekerjaan')
  final String occupation;
  @JsonKey(name: 'tgl_lahir')
  final DateTime dateBirth;
  @JsonKey(name: 'jenis_kelamin')
  final GenderEnum gender;

  /// Konstruktor untuk membuat objek SignUpRequest.
  SignUpRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.occupation,
    required this.dateBirth,
    required this.gender,
  });

  /// Membuat objek SignUpRequest dari JSON.
  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  /// Mengonversi objek SignUpRequest menjadi JSON.
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
