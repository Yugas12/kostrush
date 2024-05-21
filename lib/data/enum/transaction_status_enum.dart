import 'package:json_annotation/json_annotation.dart';

enum TransactionStatusEnum {
  @JsonValue('menunggu')
  pending,
  @JsonValue('diproses')
  processing,
  @JsonValue('selesai')
  done,
}
