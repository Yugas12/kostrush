import 'package:permission_handler/permission_handler.dart';

mixin PermissionServices {
  /// Fungsi ini buat membuka pengaturan hp untuk aplikasi ini
  Future<void> requestOpenAppSettings() async {
    var openSetting = await openAppSettings();
  }

  /// Fungsi ini buat merequest permission untuk camera
  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }

  /// Fungsi ini buat merequest permission untuk photos
  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.storage.request();
  }

  /// Fungsi ini buat merequest permission untuk location
  Future<PermissionStatus> requestLocationPermission() async {
    return await Permission.location.request();
  }

  /// Fungsi ini buat merequest permission untuk gallery
  Future<PermissionStatus> requestGalleryPermission() async {
    return await Permission.storage.request();
  }

  /// Fungsi ini buat merequest permission camera dan gallery
  Future<Map<Permission, PermissionStatus>>
      requestCameraGalleryPermission() async {
    return await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  /// Fungsi ini buat merequest permission camera, gallery, dan notification
  Future<Map<Permission, PermissionStatus>>
      requestAllRequiredPermission() async {
    return await [
      Permission.camera,
      Permission.storage,
      Permission.notification,
    ].request();
  }
}
