import 'package:get/get.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/presentation/views/success/argument/success_argument.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

/// Kelas SuccessController adalah pengontrol untuk tampilan Success.
/// Ini mengimplementasikan BaseController dengan argumen SuccessArgument dan state NoState.
class SuccessController extends BaseController<SuccessArgument, NoState> {
  @override
  void initComponent() {}

  @override
  void onObserve() {
    _startSuccess();
  }

  @override
  Future<void> onProcess() async {}

  @override
  void disposeComponent() {}

  /// Mendapatkan asset gambar untuk tampilan sukses.
  String get successAsset => _successAsset();

  /// Fungsi ini mengembalikan string yang berisi path asset untuk gambar sukses.
  String _successAsset() {
    switch (arguments.context) {
      case OtpPurposeEnum.changePassword:
        return ImageAssetConstant.successAlt;
      default:
        return ImageAssetConstant.success;
    }
  }

  /// Fungsi async yang digunakan untuk memulai tampilan sukses setelah penundaan.
  /// Fungsi ini akan menunggu selama 3 detik sebelum melanjutkan ke langkah berikutnya.
  /// Pilihan langkah berikutnya akan ditentukan berdasarkan tujuan OTP yang diberikan.
  /// Jika tujuan OTP adalah signUp, maka akan kembali ke halaman sebelumnya sebanyak 4 kali.
  /// Jika tujuan OTP adalah forgotPassword, maka akan kembali ke halaman sebelumnya sebanyak 4 kali.
  /// Jika tujuan OTP adalah changePassword, maka akan kembali ke halaman sebelumnya sebanyak 3 kali.
  /// Jika tujuan OTP adalah transaction, maka akan kembali ke halaman sebelumnya sebanyak 3 kali.
  /// Jika tidak ada tujuan OTP yang cocok, maka tidak ada langkah berikutnya yang diambil.
  Future<void> _startSuccess() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    switch (arguments.context) {
      case OtpPurposeEnum.signUp:
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        break;
      case OtpPurposeEnum.forgotPassword:
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        break;

      case OtpPurposeEnum.changePassword:
        Get.back();
        Get.back();
        Get.back();
        break;

      case OtpPurposeEnum.transaction:
        Get.back();
        Get.back();
        Get.back();
        break;

      default:
        break;
    }
  }
}
