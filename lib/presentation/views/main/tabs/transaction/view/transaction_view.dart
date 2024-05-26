import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/card/transaction_card.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../../base/base_view.dart';
import '../../../../../../data/enum/transaction_status_enum.dart';
import '../../../../../components/appbar/default_appbar.dart';
import '../controller/transaction_controller.dart';

/// Widget yang menampilkan daftar transaksi.
class TransactionView extends BaseView<TransactionController> {
  const TransactionView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Transaksi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.state?.length ?? 0,
        separatorBuilder: (context, index) => gap(8),
        itemBuilder: (context, index) {
          final transaksi = controller.state?[index];

          return TransactionCard(
            name: transaksi?.kost?.name ?? "",
            address: transaksi?.kost?.address ?? "",
            price: transaksi?.total ?? 0,
            status: transaksi?.status ?? TransactionStatusEnum.pending,
            onTap: () {
              /// Navigasi ke halaman detail transaksi.
              controller.navigateToDetailTransaction(index);
            },
          );
        },
      ),
    );
  }
}
