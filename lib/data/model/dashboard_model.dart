import 'package:kostrushapp/data/network/response/kost_response.dart';

class DashboardModel {
  final List<KostResponse> recommendedKost;
  final List<KostResponse> cheapKost;

  DashboardModel({
    required this.recommendedKost,
    required this.cheapKost,
  });
}
