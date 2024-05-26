

import 'package:kostrushapp/data/dto/profile_dto.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';

import '../network/response/transaction_response.dart';
import 'kost_dto.dart';

class TransactionDto {

  final int? id;
  final int? roomId;
  final String? roomName;
  final int? total;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final int? duration;
  final TransactionStatusEnum? status;
  final ProfileDto? user;
  final KostDto? kost;

  TransactionDto({
    required this.id,
    this.roomId,
    this.roomName,
    this.total,
    this.checkIn,
    this.checkOut,
    this.duration,
    this.status,
    this.user,
    this.kost,
  });

  factory TransactionDto.fromResponse(TransactionResponse response) {
    return TransactionDto(
      id: int.tryParse(response.id.toString()),
      roomId: int.tryParse(response.roomId.toString()),
      roomName: response.roomName,
      total: int.tryParse(response.total.toString()),
      checkIn: response.checkIn,
      checkOut: response.checkOut,
      duration: int.tryParse(response.duration.toString()),
      status: response.status,
      user: response.user != null ? ProfileDto.fromResponse(response.user!) : null,
      kost: response.kost != null ? KostDto.fromResponse(response.kost!) : null,
    );
  }


}