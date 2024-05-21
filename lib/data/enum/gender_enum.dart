import 'package:json_annotation/json_annotation.dart';

enum GenderEnum {
  @JsonValue('laki-laki')
  Male,
  @JsonValue('perempuan')
  Female,
}

GenderEnum fromString(String value) {
  switch (value) {
    case 'laki-laki':
      return GenderEnum.Male;
    case 'perempuan':
      return GenderEnum.Female;
    default:
      return GenderEnum.Male;
  }
}
