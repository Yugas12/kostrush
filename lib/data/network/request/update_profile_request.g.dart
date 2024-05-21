// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['no_hp'] as String,
      address: json['alamat'] as String,
      occupation: json['pekerjaan'] as String,
      dateBirth: DateTime.parse(json['tgl_lahir'] as String),
      gender: $enumDecode(_$GenderEnumEnumMap, json['jenis_kelamin']),
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'no_hp': instance.phone,
      'alamat': instance.address,
      'pekerjaan': instance.occupation,
      'tgl_lahir': instance.dateBirth.toIso8601String(),
      'jenis_kelamin': _$GenderEnumEnumMap[instance.gender]!,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.Male: 'laki-laki',
  GenderEnum.Female: 'perempuan',
};
