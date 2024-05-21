import 'package:get/get.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/utils/service/permission_service.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/local/share_pref/storage_preference.dart';

class ApplicationUseCase with PermissionServices {
  final _logger = Get.find<Logger>();
  final _storage = Get.find<StoragePreference>();

  /// Fungsi ini buat menghandle permission camera dan gallery
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

  Future<bool> isUserLoggedIn() async {
    final token = await _storage.readSecureData(StorageConstant.sessionToken);
    return token != null && token.isNotEmpty;
  }
}
