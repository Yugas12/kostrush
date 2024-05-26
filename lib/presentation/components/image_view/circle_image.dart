import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';
import 'package:logger/logger.dart';

import '../../themes/color_theme.dart';

/// Widget untuk menampilkan gambar dalam bentuk lingkaran.
class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.imageEndpoint,
    this.radius = 24.0,
    this.borderWidth,
    required this.child,
  });

  final String imageEndpoint;
  final double radius;
  final double? borderWidth;
  final Widget child;

  /// Membuat widget gambar lingkaran dengan menggunakan gambar dari URL.
  ///
  /// [imageEndpoint] adalah endpoint dari gambar yang akan ditampilkan.
  /// [radius] adalah jari-jari dari gambar lingkaran (default: 24.0).
  /// [borderWidth] adalah lebar border gambar lingkaran (opsional).
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// CircleImage.network(
  ///   imageEndpoint: 'https://example.com/image.jpg',
  ///   radius: 32.0,
  ///   borderWidth: 2.0,
  /// )
  /// ```
  ///factory CircleImage.network({
  ///  required String imageEndpoint,
  ///  double radius = 24.0,
  ///  double? borderWidth,
  /// })
  factory CircleImage.network({
    required String imageEndpoint,
    double radius = 24.0,
    double? borderWidth,
  }) {
    return CircleImage(
      imageEndpoint: imageEndpoint,
      radius: radius,
      borderWidth: borderWidth,
      child: CachedNetworkImage(
        imageUrl:
            // "${RemoteConstant.baseUrl}$imageEndpoint?time=${DateTime.now().millisecondsSinceEpoch}",
            "https://picsum.photos/200",
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
        errorWidget: (BuildContext context, String url, Object error) {
          final Logger log = Get.find<Logger>();

          log.e("Error image profile: $imageEndpoint");
          log.e("Error image profile: $error");

          return Container(
            width: radius * 2,
            height: radius * 2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(ImageAssetConstant.profilePlaceholder),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
        placeholder: (context, url) => SizedBox(
          height: radius * 2,
          width: radius * 2,
        ),
      ),
    );
  }

  /// Membuat widget gambar lingkaran dengan menggunakan asset gambar.
  ///
  /// [imageAsset] merupakan path dari asset gambar yang akan ditampilkan.
  /// [radius] merupakan ukuran radius dari gambar lingkaran (default: 24.0).
  /// [borderWidth] merupakan lebar border gambar lingkaran (opsional).
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// CircleImage.asset(
  ///   imageAsset: 'assets/images/profile.png',
  ///   radius: 32.0,
  ///   borderWidth: 2.0,
  /// )
  /// ```
  factory CircleImage.asset({
    required String imageAsset,
    double radius = 24.0,
    double? borderWidth,
  }) {
    return CircleImage(
      imageEndpoint: imageAsset,
      radius: radius,
      borderWidth: borderWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// Membuat widget gambar lingkaran dari file gambar.
  ///
  /// [imageFile] merupakan path dari file gambar yang akan ditampilkan.
  /// [radius] merupakan ukuran radius lingkaran gambar. Defaultnya adalah 24.0.
  /// [borderWidth] merupakan lebar border gambar. Jika tidak ditentukan, maka tidak akan ada border.
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// CircleImage.file(
  ///   imageFile: 'path/to/image.jpg',
  ///   radius: 32.0,
  ///   borderWidth: 2.0,
  /// )
  /// ```
  factory CircleImage.file({
    required String imageFile,
    double radius = 24.0,
    double? borderWidth,
  }) {
    return CircleImage(
      imageEndpoint: imageFile,
      radius: radius,
      borderWidth: borderWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: Image.file(
            File(imageFile),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return borderWidth != null ? _borderBuilder() : _baseBuilder();
  }

  Widget _borderBuilder() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorsTheme.primaryColor,
          width: borderWidth!,
        ),
      ),
      child: _baseBuilder(),
    );
  }

  /// Widget untuk membangun gambar dengan bentuk lingkaran.
  Widget _baseBuilder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );
  }
}
