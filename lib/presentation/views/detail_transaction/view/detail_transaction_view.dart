import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';
import 'package:kostrushapp/utils/extensions/int_ext.dart';
import 'package:kostrushapp/utils/mixins/custom_sliver_mixin.dart';

import '../../../../base/base_view.dart';
import '../../../../res/painter/dash_line_painter.dart';
import '../../../components/appbar/default_appbar.dart';
import '../../../components/input/main_text_input.dart';
import '../../../themes/typography_theme.dart';
import '../controller/detail_transaction_controller.dart';

/// FILEPATH: /B:/kostrush/lib/presentation/views/detail_transaction/view/detail_transaction_view.dart
/// 
/// Kelas DetailTransactionView adalah tampilan halaman detail transaksi.
/// Kelas ini mengimplementasikan BaseView dan CustomSliverMixin.
class DetailTransactionView extends BaseView<DetailTransactionController>
    with CustomSliverMixin {
  
  /// Konstruktor DetailTransactionView.
  /// 
  /// [key] adalah kunci unik untuk widget ini.
  const DetailTransactionView({super.key});

  /// Mengoverride metode appBar untuk menampilkan AppBar kustom.
  /// 
  /// Metode ini mengembalikan widget PreferredSizeWidget yang berisi DefaultAppBar dengan judul "Detail Transaksi".
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Detail Transaksi",
    );
  }

  /// Mengoverride metode body untuk menampilkan isi halaman.
  /// 
  /// Metode ini mengembalikan widget RefreshIndicator yang berisi CustomScrollView dengan beberapa Sliver.
  /// Sliver ini berisi form builder, time picker builder, summary builder, dan bottom button builder.
  @override
  Widget body(BuildContext context, state) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _formBuilder(),
          ),
          sliverDivider(),
          SliverToBoxAdapter(
            child: _timePickerBuilder(),
          ),
          sliverDivider(),
          SliverToBoxAdapter(
            child: _summaryBuilder(),
          ),
          sliverDivider(),
          SliverToBoxAdapter(
            child: _bottomButtonBuilder(),
          )
        ],
      ),
    );
  }

  /// Metode untuk membangun form.
  /// 
  /// Metode ini mengembalikan widget Container yang berisi Column dengan beberapa MainTextInput.
  /// MainTextInput digunakan untuk menginputkan informasi penyewa seperti nama, nomor telepon, pekerjaan, dan tipe kamar.
  Widget _formBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Penyewa",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          MainTextInput(
            controller: controller.nameController,
            label: "Nama",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.phoneController,
            label: "Nomor Telepon",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.occupationController,
            label: "Pekerjaan",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.roomTypeController,
            label: "Tipe Kamar",
            focusNode: controller.noFocusNode,
          ),
        ],
      ),
    );
  }

  /// Metode untuk membangun time picker.
  /// 
  /// Metode ini mengembalikan widget Container yang berisi Column dengan beberapa MainTextInput.
  /// MainTextInput digunakan untuk memilih tanggal sewa dan durasi sewa.
  Widget _timePickerBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanggal Sewa Kost",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          MainTextInput(
            controller: controller.dateController,
            label: "Tanggal Mulai Sewa",
            hintText: "Pilih Tanggal",
            focusNode: controller.noFocusNode,
          ),
          gap(8),
          MainTextInput(
            controller: controller.durationController,
            label: "Durasi Sewa",
            hintText: "Pilih Durasi",
            focusNode: controller.noFocusNode,
          ),
        ],
      ),
    );
  }

  /// Metode untuk membangun summary.
  /// 
  /// Metode ini mengembalikan widget Container yang berisi Column dengan beberapa Text.
  /// Text ini menampilkan informasi biaya sewa kost.
  Widget _summaryBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biaya Sewa Kost",
            style: TypographyTheme.labelLarge,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomPaint(
              painter: DashedLinePainter(),
              child: Container(
                height: 1,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Total Biaya Sewa Kost",
                style: TypographyTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                (int.tryParse(controller.state!.total ?? "0") ?? 0).toRupiah(),
                style: TypographyTheme.labelLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Metode untuk membangun bottom button.
  /// 
  /// Metode ini mengembalikan widget Container yang berisi Column dengan beberapa Text.
  /// Text ini menampilkan status transaksi dan pesan status.
  Widget _bottomButtonBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: _statusColor(
                  controller.state?.status ?? TransactionStatusEnum.pending),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                controller.state?.status?.value ?? "",
                style: TypographyTheme.labelMedium.copyWith(
                  color: ColorsTheme.neutralColor[1000],
                ),
              ),
            ),
          ),
          gap(8),
          Text(
            controller.state?.status?.message ?? "",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  /// Metode untuk mendapatkan warna status transaksi.
  /// 
  /// Metode ini mengembalikan warna yang sesuai dengan status transaksi.
  Color? _statusColor(TransactionStatusEnum status) {
    switch (status) {
      case TransactionStatusEnum.pending:
        return ColorsTheme.secondaryColor;
      case TransactionStatusEnum.processing:
        return ColorsTheme.primaryColor[900];
      default:
        return ColorsTheme.primaryColor;
    }
  }
}
