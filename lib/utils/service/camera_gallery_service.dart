import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../domain/use_case/app_use_case.dart';
import '../../presentation/themes/color_theme.dart';

mixin CameraGalleryService {
  final _logger = Get.find<Logger>();
  final _imagePicker = ImagePicker();
  final _permissionService = Get.find<ApplicationUseCase>();

  /// Fungsi ini buat request permission camera dan gallery
  Future<bool> requestCameraGalleryPermissions() async {
    var cameraGalleryPermission =
        await _permissionService.handleCameraGalleryPermission();

    if (!cameraGalleryPermission) {
      Get.dialog(
        AlertDialog(
          title: Text("Permission Required"),
          content: Text("Please allow camera and gallery permission"),
          actions: [
            TextButton(
              onPressed: () async {
                await _permissionService.requestOpenAppSettings();
              },
              child: Text("Buka Pengaturan"),
            ),
          ],
        ),
      );

      return false;
    }

    return cameraGalleryPermission;
  }

  /// Fungsi ini buat membuka kamera
  /// Dibutuhkan parameter [isPermissionGranted] untuk mengecek apakah permission sudah diberikan
  /// Dibutuhkan parameter [onImagePicked] untuk mengembalikan file yang dipilih
  /// Dibutuhkan parameter [onError] untuk mengembalikan error jika terjadi
  Future<void> openCamera({
    required bool isPermissionGranted,
    required Function(File) onImagePicked,
    required Function(String) onError,
  }) async {
    if (isPermissionGranted) {
      try {
        File imageFile = File("");
        final imagePicked =
            await _imagePicker.pickImage(source: ImageSource.camera);
        if (imagePicked != null) {
          imageFile = File(imagePicked.path);

          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: imageFile.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            compressQuality: 80,
            maxWidth: 700,
            maxHeight: 700,
            cropStyle: CropStyle.rectangle,
            compressFormat: ImageCompressFormat.png,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: ColorsTheme.primaryColor,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
            ],
          );

          if (croppedFile != null) {
            _logger.d("Cropped File Path : ${croppedFile.path}");
            imageFile = File(croppedFile.path);
            onImagePicked(imageFile);
          } else {
            throw PlatformException(
                code: "CROP_FAILED", message: "Crop file is null");
          }
        }
      } on PlatformException catch (e) {
        _logger.e(e.toString());
        onError(e.toString());
      }
    }
  }

  /// Fungsi ini buat membuka gallery
  /// Dibutuhkan parameter [isPermissionGranted] untuk mengecek apakah permission sudah diberikan
  /// Dibutuhkan parameter [onImagePicked] untuk mengembalikan file yang dipilih
  /// Dibutuhkan parameter [onError] untuk mengembalikan error jika terjadi
  Future<void> openGallery({
    required bool isPermissionGranted,
    required Function(File) onImagePicked,
    required Function(String) onError,
  }) async {
    if (isPermissionGranted) {
      try {
        File imageFile = File("");
        final imagePicked =
            await _imagePicker.pickImage(source: ImageSource.gallery);
        if (imagePicked != null) {
          imageFile = File(imagePicked.path);

          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: imageFile.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
            compressQuality: 80,
            maxWidth: 700,
            maxHeight: 700,
            cropStyle: CropStyle.rectangle,
            compressFormat: ImageCompressFormat.png,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: ColorsTheme.primaryColor,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
            ],
          );

          if (croppedFile != null) {
            _logger.d("Cropped File Path : ${croppedFile.path}");
            imageFile = File(croppedFile.path);
            onImagePicked(imageFile);
          } else {
            throw PlatformException(
                code: "CROP_FAILED", message: "Crop file is null");
          }
        }
      } on PlatformException catch (e) {
        _logger.d(e.toString());
        onError(e.toString());
      }
    }
  }
}
