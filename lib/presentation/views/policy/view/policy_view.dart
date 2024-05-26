import 'package:flutter/material.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/policy_controller.dart';

/// Widget untuk tampilan kebijakan dan privasi.
class PolicyView extends BaseView<PolicyController> {
  const PolicyView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Kebijakan & Privasi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Privasi dan kebijakan merupakan prioritas utama dalam pengembangan aplikasi Kos Rush. Kami berkomitmen untuk melindungi data pribadi pengguna kami dengan sepenuhnya. Untuk itu, kami mengimplementasikan langkah-langkah keamanan yang ketat untuk memastikan bahwa informasi sensitif seperti nama, alamat, dan informasi pembayaran dilindungi secara maksimal. Selain itu, kami tidak akan membagikan atau menjual data pengguna kepada pihak ketiga tanpa izin yang jelas dari pengguna.",
            ),
            gap(16),
            Text(
              "Kami juga menghargai privasi pengguna dalam pengalaman penggunaan aplikasi Kos Rush. Dalam hal ini, kami mengumpulkan informasi hanya yang diperlukan untuk meningkatkan kualitas layanan kami, seperti preferensi pengguna untuk rekomendasi kos yang lebih akurat. Pengguna memiliki kontrol penuh atas data mereka dan dapat mengakses, memperbarui, atau menghapus informasi mereka kapan pun mereka mau. Dengan komitmen kami terhadap kebijakan privasi yang ketat, pengguna dapat menggunakan Kos Rush dengan percaya diri, mengetahui bahwa data pribadi mereka aman dan dilindungi dengan baik.",
            ),
          ],
        ),
      ),
    );
  }
}
