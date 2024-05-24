import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';

/// Kelas yang merepresentasikan argumen untuk perubahan password.
class ChangePasswordArgument extends BaseArguments {
  /// Alamat email pengguna.
  final String email;

  /// Konteks tujuan penggunaan OTP.
  final OtpPurposeEnum context;

  /// Konstruktor untuk membuat objek ChangePasswordArgument.
  ///
  /// [email] adalah alamat email pengguna.
  /// [context] adalah konteks tujuan penggunaan OTP, defaultnya adalah OtpPurposeEnum.changePassword.
  ChangePasswordArgument({
    required this.email,
    this.context = OtpPurposeEnum.changePassword,
  });
}
