import 'package:flutter/material.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/selected_result_controller.dart';

/// Kelas SelectedResultView adalah kelas yang mewakili tampilan hasil terpilih.
/// Kelas ini merupakan turunan dari kelas BaseView dan menggunakan SelectedResultController sebagai kontroler.
class SelectedResultView extends BaseView<SelectedResultController> {
  const SelectedResultView({super.key});

  /// Mengembalikan widget PreferredSizeWidget yang digunakan sebagai app bar.
  /// App bar ini menggunakan DefaultAppBar dengan judul yang diambil dari controller.
  /// 
  /// Return:
  /// - PreferredSizeWidget: Widget app bar yang digunakan.
  ///
  /// Example usage:
  /// ```dart
  /// @override
  /// PreferredSizeWidget? appBar(BuildContext context) {
  ///   return DefaultAppBar(
  ///     appbarTitle: controller.title,
  ///   );
  /// }
  /// ```
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: controller.title,
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: (controller.state ?? []).isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 240,
              ),
              itemCount: controller.state?.length ?? 0,
              itemBuilder: (context, index) {

                /// Mendapatkan data kost dari state.
                final kost = controller.state?[index];

                return Center(
                  child: DormCard(
                    type: kost?.type ?? "",
                    price: kost!.startPrice ?? 0,
                    name: kost?.name ?? "",
                    address: kost?.address ?? "",
                    onTap: () {
                      /// Navigasi ke halaman detail kost.
                      controller.navigateToDetailDormitory(kost?.id);
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text("Data tidak ditemukan"),
            ),
    );
  }

  /// Widget untuk menampilkan kontainer error dengan pesan yang diberikan.
  ///
  /// Parameter [message] adalah pesan error yang akan ditampilkan.
  /// 
  /// Mengembalikan widget [Center] dengan tata letak [Column] yang berisi teks pesan error.
  @override
  Widget errorContainer(String message) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Belum ada data"),
        ],
      ),
    );
  }
}
