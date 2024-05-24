import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/gender_enum.dart';

part 'update_profile_request.g.dart';

/// Kelas model yang merepresentasikan permintaan untuk memperbarui profil pengguna.
@JsonSerializable()
class UpdateProfileRequest {
  final String name;
  final String email;
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

  /// Konstruktor untuk membuat instance dari [UpdateProfileRequest].
  UpdateProfileRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.occupation,
    required this.dateBirth,
    required this.gender,
  });

  /// Membuat instance [UpdateProfileRequest] dari JSON.
  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  /// Mengonversi instance [UpdateProfileRequest] menjadi JSON.
  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
