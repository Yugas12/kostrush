import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';
import 'package:logger/logger.dart';

import '../../themes/color_theme.dart';

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

  Widget _baseBuilder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );
  }
}
