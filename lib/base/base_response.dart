import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/// Kelas `BaseResponse` adalah kelas generik yang mewakili respons dasar dari API.
/// Respons dasar terdiri dari status, pesan, dan data yang dikembalikan oleh API.
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final int? status;
  final List<String?>? message;
  final T? data;

  /// Konstruktor untuk kelas `BaseResponse`.
  /// Menerima parameter opsional `status`, `message`, dan `data`.
  BaseResponse({this.status, this.message, this.data});

  /// Factory method untuk membuat instance `BaseResponse` dari JSON.
  /// Menerima parameter `json` yang merupakan representasi JSON dari respons API,
  /// dan `fromJsonT` yang merupakan fungsi untuk mengubah JSON menjadi objek tipe `T`.
  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
    _$BaseResponseFromJson(json, fromJsonT);

  /// Mengonversi instance `BaseResponse` menjadi JSON.
  /// Menerima parameter `toJsonT` yang merupakan fungsi untuk mengubah objek tipe `T` menjadi JSON.
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) =>
    _$BaseResponseToJson(this, toJsonT);
}
