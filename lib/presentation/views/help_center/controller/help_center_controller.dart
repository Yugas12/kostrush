import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

/// Kelas [HelpCenterController] adalah pengontrol untuk tampilan Help Center.
/// Kelas ini mengimplementasikan [BaseController] dengan argumen [NoArguments] dan state [NoState].
class HelpCenterController extends BaseController<NoArguments, NoState> {
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

  /// Metode [intentToInstagram] digunakan untuk membuka aplikasi Instagram.
  /// Metode ini akan membuka profil pengguna dengan username "Yugas12".
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

  /// Metode [intentToWhatsapp] digunakan untuk membuka aplikasi WhatsApp.
  /// Metode ini akan membuka percakapan dengan nomor telepon "6281913236990".
  void intentToWhatsapp() async {
    final Uri uri = Uri(
      scheme: 'https',
      path: 'wa.me/6281913236990',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not launch Whatsapp'),
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

  /// Metode [intentToMaps] digunakan untuk membuka aplikasi Maps.
  /// Metode ini akan membuka lokasi dengan koordinat latitude -7.5947598 dan longitude 111.8951109.
  /// Metode ini juga akan menampilkan label "Polije Nganjuk" pada lokasi yang dibuka.
  void intentToMaps() async {
    final lat = -7.5947598;
    final long = 111.8951109;

    final query = '$lat,$long';

    final Uri uri = Uri(
      scheme: 'geo',
      host: query,
      queryParameters: {
        'q': "Polije Nganjuk",
      },
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Could not launch Maps'),
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
