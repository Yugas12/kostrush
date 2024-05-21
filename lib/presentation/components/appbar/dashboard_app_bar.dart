import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';

/// Class ini digunakan untuk membuat appbar dashboard
class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsTheme.primaryColor[800],
      centerTitle: true,
      title: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Selamat Datang"),
            Text("Di KostRush "),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 72);
}
