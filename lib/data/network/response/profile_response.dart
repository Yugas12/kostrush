import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/gender_enum.dart';

part 'profile_response.g.dart';

/// Kelas yang merepresentasikan respons profil pengguna.
@JsonSerializable()
class ProfileResponse {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'alamat')
  final String? address;
  @JsonKey(name: 'tgl_lahir')
  final DateTime? dateBirth;
  @JsonKey(name: 'no_hp')
  final String? phoneNumber;
  @JsonKey(name: 'jenis_kelamin')
  final GenderEnum? gender;
  @JsonKey(name: 'pekerjaan')
  final String? occupation;

  /// Konstruktor untuk membuat objek ProfileResponse.
  ProfileResponse({
    this.id,
    this.name,
    this.email,
    this.address,
    this.dateBirth,
    this.phoneNumber,
    this.gender,
    this.occupation,
  });

  /// Membuat objek ProfileResponse dari JSON.
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  /// Mengonversi objek ProfileResponse menjadi JSON.
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
