import 'package:kostrushapp/data/dto/kost_dto.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';

class DashboardModel {
  final List<KostDto> recommendedKost;
  final List<KostDto> cheapKost;

  DashboardModel({
    required this.recommendedKost,
    required this.cheapKost,
  });
}
