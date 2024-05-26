import 'package:flutter/material.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/location_result_controller.dart';

/// Widget untuk menampilkan hasil pencarian lokasi.
class LocationResultView extends BaseView<LocationResultController> {
  const LocationResultView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Kost Daerah ${controller.arguments.locationName}",
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
                final kost = controller.state?[index];

                return Center(
                  child: DormCard(
                    type: kost?.type ?? "",
                    price: kost!.startPrice ?? 0,
                    name: kost.name ?? "",
                    address: kost.address ?? "",
                    onTap: () {
                      controller.navigateToDetailDormitory(kost?.id);
                    },
                  ),
                );
              },
            )
          : SingleChildScrollView(
              child: Center(
                child: Text("Data tidak ditemukan"),
              ),
            ),
    );
  }

  @override
  Widget errorContainer(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Belum ada data"),
        ],
      ),
    );
  }
}
