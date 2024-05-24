import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';

/// Kelas SuccessArgument adalah turunan dari BaseArguments.
/// Kelas ini memiliki atribut context, title, description, dan buttonText.
/// Digunakan Untuk mengirimkan data ke tampilan sukses.
class SuccessArgument extends BaseArguments {
  final OtpPurposeEnum context;
  final String title, description, buttonText;

  SuccessArgument(
      {required this.context,
      required this.title,
      required this.description,
      required this.buttonText});
}
