import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/button/main_button.dart';
import '../controller/help_center_controller.dart';

/// Widget untuk tampilan Pusat Bantuan.
class HelpCenterView extends BaseView<HelpCenterController> {
  const HelpCenterView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Pusat Bantuan",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hubungi Kami :"),
          gap(16),
          MainButton.icon(
            label: "Instagram",
            icon: FaIcon(FontAwesomeIcons.instagram),
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.intentToInstagram();
            },
          ),
          gap(8),
          MainButton.icon(
            label: "Whatsapp",
            icon: FaIcon(FontAwesomeIcons.whatsapp),
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.intentToWhatsapp();
            },
          ),
          gap(8),
          MainButton.icon(
            label: "Alamat Kantor",
            icon: FaIcon(FontAwesomeIcons.building),
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.intentToMaps();
            },
          ),
        ],
      ),
    );
  }
}
