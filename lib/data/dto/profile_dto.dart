

import 'package:kostrushapp/data/enum/gender_enum.dart';
import 'package:kostrushapp/data/network/response/profile_response.dart';

class ProfileDto {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final DateTime? dateBirth;
  final String? phoneNumber;
  final GenderEnum? gender;
  final String? occupation;

  ProfileDto({
    required this.id,
    this.name,
    this.email,
    this.address,
    this.dateBirth,
    this.phoneNumber,
    this.gender,
    this.occupation,
  });

  factory ProfileDto.fromResponse(ProfileResponse response) {
    return ProfileDto(
      id: int.tryParse(response.id.toString()),
      name: response.name,
      email: response.email,
      address: response.address,
      dateBirth: response.dateBirth,
      phoneNumber: response.phoneNumber,
      gender: response.gender,
      occupation: response.occupation,
    );
  }
}