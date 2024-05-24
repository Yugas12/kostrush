import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/appbar/dashboard_app_bar.dart';
import 'package:kostrushapp/presentation/components/card/dorm_card.dart';
import 'package:kostrushapp/presentation/components/card/location_card.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../components/input/main_text_input.dart';
import '../../../../../themes/color_theme.dart';
import '../controller/dashboard_controller.dart';

/// Kelas `DashboardView` adalah tampilan utama untuk tab dashboard dalam aplikasi.
class DashboardView extends BaseView<DashboardController> {
  const DashboardView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const DashboardAppBar();
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MainTextInput(
                controller: controller.searchController,
                hintText: "Cari Kost",
                focusNode: controller.noFocusNode,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsTheme.primaryColor,
                ),
                onContainerTap: () {
                  controller.navigateToSearch();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _locationBuilder(),
          ),
          SliverToBoxAdapter(
            child: _popularBuilder(),
          ),
          SliverToBoxAdapter(
            child: _recommendedBuilder(),
          ),
        ],
      ),
    );
  }

  /// Widget untuk membangun tampilan lokasi.
  Widget _locationBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Lokasi Terdekat",
            style: TypographyTheme.labelLarge,
          ),
          gap(8),
          ExpandChild(
            collapsedVisibilityFactor: 0.25,
            indicatorBuilder: (context, Function() onExpand, isExpand) {
              return InkWell(
                onTap: onExpand,
                splashFactory: NoSplash.splashFactory,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.center,
                  child: Text(
                    isExpand ? "Tutup" : "Lihat Semua",
                    style: TypographyTheme.labelSmall.copyWith(
                      color: ColorsTheme.primaryColor,
                    ),
                  ),
                ),
              );
            },
            child: Wrap(
              alignment: WrapAlignment.center,
              children: controller.locationList.asMap().entries.map((entry) {
                final int index = entry.key;
                final Map<String, String> element = entry.value;
                return LocationCard(
                  name: element["name"] ?? "",
                  imagePath: element["imagePath"] ?? "",
                  onTap: () {
                    /// Navigasi ke halaman pencarian kost.
                    controller.navigateToLocationResult(index);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget untuk membangun tampilan kost populer.
  Widget _popularBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kost Populer",
                  style: TypographyTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    controller.navigateToPopularDormitory();
                  },
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Text(
                    "Lihat Semua",
                  ),
                )
              ],
            ),
          ),
          gap(8),
          SizedBox(
            height: 260,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              separatorBuilder: (context, index) => const SizedBox(width: 8.0),
              itemCount: controller.state?.recommendedKost.length ?? 0,
              itemBuilder: (context, index) {
                final kost = controller.state?.recommendedKost[index];

                return DormCard(
                  type: kost?.type ?? "",
                  price: int.tryParse(kost!.startPrice!) ?? 0,
                  name: kost?.name ?? "",
                  address: kost?.address ?? "",
                  onTap: () {
                    /// Navigasi ke halaman detail kost.
                    controller.navigateToCheapDormitoryDetail(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Widget untuk membangun tampilan kost rekomendasi.
  Widget _recommendedBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kost Termurah",
                  style: TypographyTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {
                    controller.navigateToCheapDormitory();
                  },
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Text(
                    "Lihat Semua",
                  ),
                )
              ],
            ),
          ),
          gap(8),
          SizedBox(
            height: 260,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              separatorBuilder: (context, index) => const SizedBox(width: 8.0),
              itemCount: controller.state?.cheapKost.length ?? 0,
              itemBuilder: (context, index) {
                final kost = controller.state?.cheapKost[index];

                return DormCard(
                  type: kost?.type ?? "",
                  price: int.tryParse(kost!.startPrice!) ?? 0,
                  name: kost?.name ?? "",
                  address: kost?.address ?? "",
                  onTap: () {
                    /// Navigasi ke halaman detail kost.
                    controller.navigateToCheapDormitoryDetail(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
