import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/about_us_controller.dart';

class AboutUsView extends BaseView<AboutUsController> {
  const AboutUsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Tentang Kami",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tentang  Pengembang : "),
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
            label: "Email",
            icon: Icon(Icons.email_outlined),
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.intentToEmail();
            },
          ),
        ],
      ),
    );
  }
}
