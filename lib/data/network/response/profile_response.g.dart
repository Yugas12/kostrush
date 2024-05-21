// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['alamat'] as String?,
      dateBirth: json['tgl_lahir'] == null
          ? null
          : DateTime.parse(json['tgl_lahir'] as String),
      phoneNumber: json['no_hp'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['jenis_kelamin']),
      occupation: json['pekerjaan'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'alamat': instance.address,
      'tgl_lahir': instance.dateBirth?.toIso8601String(),
      'no_hp': instance.phoneNumber,
      'jenis_kelamin': _$GenderEnumEnumMap[instance.gender],
      'pekerjaan': instance.occupation,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.Male: 'laki-laki',
  GenderEnum.Female: 'perempuan',
};
