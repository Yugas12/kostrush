import 'package:kostrushapp/base/base_argument.dart';

/// Kelas ini digunakan untuk menyimpan argumen hasil lokasi.
class LocationResultArgument extends BaseArguments {
  /// Nama lokasi.
  final String locationName;

  /// Konstruktor untuk membuat objek LocationResultArgument.
  ///
  /// [locationName] adalah nama lokasi yang akan disimpan.
  LocationResultArgument({required this.locationName});
}
