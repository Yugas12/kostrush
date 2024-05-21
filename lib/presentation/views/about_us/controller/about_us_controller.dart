import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class AboutUsController extends BaseController<NoArguments, NoState> {
  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  void intentToInstagram() async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'www.instagram.com',
      path: 'Yugas12',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not launch Instagram'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void intentToEmail() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'wahyuprastyo907@gmail.com',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not launch Email'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
