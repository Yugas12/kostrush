import 'package:kostrushapp/base/base_argument.dart';

/// Kelas yang merepresentasikan argumen untuk halaman pendaftaran akun.
class AccountSignUpArgument extends BaseArguments {
  /// Nama pengguna.
  final String name;

  /// Nomor telepon pengguna.
  final String phoneNumber;

  /// Pekerjaan pengguna (opsional).
  final String? occupation;

  /// Alamat pengguna (opsional).
  final String? address;

  /// Konstruktor untuk membuat objek AccountSignUpArgument.
  AccountSignUpArgument({
    required this.name,
    required this.phoneNumber,
    this.occupation,
    this.address,
  });
}
