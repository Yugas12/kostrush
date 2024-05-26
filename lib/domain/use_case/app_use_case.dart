import 'package:get/get.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/service/permission_service.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/local/share_pref/storage_preference.dart';

class ApplicationUseCase with PermissionServices {
  final _logger = Get.find<Logger>();
  final _storage = Get.find<StoragePreference>();

  /// Menghandle izin kamera dan galeri.
  /// 
  /// Fungsi ini akan meminta izin kamera dan galeri menggunakan fungsi [requestCameraGalleryPermission].
  /// Jika izin kamera diberikan, fungsi akan mengembalikan nilai `true`.
  /// Jika izin kamera ditolak, fungsi akan mengembalikan nilai `false`.
  /// 
  /// Contoh penggunaan:
  /// 
  /// ```dart
  /// bool result = await handleCameraGalleryPermission();
  /// if (result) {
  ///   // Izin kamera diberikan
  /// } else {
  ///   // Izin kamera ditolak
  /// }
  /// ```
  Future<bool> handleCameraGalleryPermission() async {
    var permissions = await requestCameraGalleryPermission();

    _logger.d(permissions);

    if (permissions[Permission.camera] == PermissionStatus.granted) {
      _logger.d("Granted");
      return true;
    }

    _logger.e("Denied");
    return false;
  }

  /// Fungsi ini digunakan untuk memeriksa apakah pengguna sudah masuk atau belum.
  /// 
  /// Fungsi ini akan mengambil token sesi dari penyimpanan aman dan memeriksa apakah token tersebut tidak null dan tidak kosong.
  /// Jika token tidak null dan tidak kosong, maka pengguna dianggap sudah masuk.
  /// 
  /// Returns `true` jika pengguna sudah masuk, `false` jika pengguna belum masuk.
  Future<bool> isUserLoggedIn() async {
    final token = await _storage.readSecureData(StorageConstant.sessionToken);
    return token != null && token.isNotEmpty;
  }
}
