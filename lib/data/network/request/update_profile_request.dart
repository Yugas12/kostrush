import 'package:json_annotation/json_annotation.dart';
import 'package:kostrushapp/data/enum/gender_enum.dart';

part 'update_profile_request.g.dart';

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

  UpdateProfileRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.occupation,
    required this.dateBirth,
    required this.gender,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
