import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/appbar/search_appbar.dart';

import '../../../../base/base_view.dart';
import '../../../components/card/dorm_card.dart';
import '../controller/search_controller.dart';

class SearchView extends BaseView<SearchViewController> {
  const SearchView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return SearchAppBar(
      controller: controller.searchController,
      focusNode: controller.focusNode,
      onChanged: controller.onChangeSearch,
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
                    price: kost?.startPrice ?? 0,
                    name: kost?.name ?? "",
                    address: kost?.address ?? "",
                    onTap: () {
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
