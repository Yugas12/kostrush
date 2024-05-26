import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/input/main_text_input.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';
import 'package:kostrushapp/utils/extensions/int_ext.dart';
import 'package:kostrushapp/utils/mixins/custom_sliver_mixin.dart';

import '../../../../base/base_view.dart';
import '../../../../res/painter/dash_line_painter.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/order_form_controller.dart';

/// FILEPATH: /B:/kostrush/lib/presentation/views/order_form/view/order_form_view.dart
/// 
/// Kelas [OrderFormView] adalah tampilan untuk formulir pemesanan.
/// Kelas ini mengimplementasikan [BaseView] dan [CustomSliverMixin].
class OrderFormView extends BaseView<OrderFormController> with CustomSliverMixin {
  const OrderFormView({super.key});

  /// Mengoverride method [appBar] untuk mengatur tampilan app bar.
  /// Method ini mengembalikan [PreferredSizeWidget] yang berisi [DefaultAppBar].
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Form Pemesanan",
    );
  }

  /// Mengoverride method [body] untuk mengatur tampilan body.
  /// Method ini mengembalikan [Column] yang berisi beberapa widget seperti [RefreshIndicator], [CustomScrollView], dan widget-widget lainnya.
  @override
  Widget body(BuildContext context, state) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _formBuilder(),
                ),
                SliverToBoxAdapter(
                  child: _documentPickerBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _timePickerBuilder(),
                ),
                sliverDivider(),
                SliverToBoxAdapter(
                  child: _summaryBuilder(),
                ),
              ],
            ),
          ),
        ),
        _bottomButtonBuilder(),
      ],
    );
  }

  /// Method [_formBuilder] digunakan untuk mengatur tampilan form pemesanan.
  /// Method ini mengembalikan [Container] yang berisi beberapa widget seperti [Text] dan [MainTextInput].
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
          ),
          gap(8),
          MainTextInput(
            controller: controller.phoneController,
            label: "Nomor Telepon",
          ),
          gap(8),
          MainTextInput(
            controller: controller.occupationController,
            label: "Pekerjaan",
          ),
        ],
      ),
    );
  }

  /// Method [_documentPickerBuilder] digunakan untuk mengatur tampilan pemilihan dokumen.
  /// Method ini mengembalikan [Container] yang berisi beberapa widget seperti [Text], [_documentPicker], dan [Material].
  Widget _documentPickerBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dokumen Persyaratan Masuk Kos",
            style: TypographyTheme.labelLarge,
          ),
          gap(16),
          _documentPicker(),
          gap(16),
          Text(
            "* Dokumen tersebut merupakan dokumen yang diperlukan pemilik kos untuk verifikasi.",
            style: TypographyTheme.bodySmall,
          ),
          gap(16),
          Material(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded),
                  gap(8),
                  Expanded(
                    child: Text(
                      "Pada saat masuk kos, mohon siapkan kartu identitas asli untuk verifikasi.",
                      style: TypographyTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Method [_timePickerBuilder] digunakan untuk mengatur tampilan pemilihan tanggal sewa dan durasi sewa.
  /// Method ini mengembalikan [Container] yang berisi beberapa widget seperti [Text] dan [MainTextInput].
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
            suffixIcon: const FaIcon(FontAwesomeIcons.calendarAlt),
            onContainerTap: () {
              controller.pickDate(Get.context!);
            },
          ),
          gap(8),
          MainTextInput(
            controller: controller.durationController,
            label: "Durasi Sewa",
            hintText: "Pilih Durasi",
            focusNode: controller.noFocusNode,
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
            onContainerTap: () {
              controller.navigateToDurationSelector();
            },
          ),
        ],
      ),
    );
  }

  /// Method [_summaryBuilder] digunakan untuk mengatur tampilan ringkasan biaya sewa.
  /// Method ini mengembalikan [Container] yang berisi beberapa widget seperti [Text] dan [Row].
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
          gap(16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Harga Sewa",
                      style: TypographyTheme.bodyMedium,
                    ),
                    Text(
                      "Pemabayaran diakukan secara tunai",
                      style: TypographyTheme.bodySmall,
                    )
                  ],
                ),
              ),
              Text(
                controller.price.value.toRupiah(),
                style: TypographyTheme.labelMedium,
              ),
            ],
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
              Obx(
                () => Text(
                  controller.price.value.toRupiah(),
                  style: TypographyTheme.labelLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Method [_bottomButtonBuilder] digunakan untuk mengatur tampilan tombol "Ajukan Sewa".
  /// Method ini mengembalikan [Container] yang berisi [MainButton].
  Widget _bottomButtonBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: MainButton(
        label: "Ajukan Sewa",
        buttonWidth: ButtonWidth.full,
        onTap: () {
          controller.submitOrder();
        },
      ),
    );
  }

  /// Method [_documentPicker] digunakan untuk mengatur tampilan pemilihan dokumen.
  /// Method ini mengembalikan [Container] yang berisi beberapa widget seperti [Text], [_unselectedDocument], dan [_documentImage].
  Widget _documentPicker() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Silahkan upload bukti identitas pada kolom dibawah ini"),
          gap(16),
          Obx(() => controller.selectedFile.value == null
              ? _unselectedDocument()
              : _documentImage()),
        ],
      ),
    );
  }

  /// Method [_unselectedDocument] digunakan untuk mengatur tampilan ketika dokumen belum dipilih.
  /// Method ini mengembalikan [InkWell] yang berisi [Container] dan [Text].
  Widget _unselectedDocument() {
    return InkWell(
      onTap: controller.launchGallery,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: ColorsTheme.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Text(
              "Pilih File",
              style: TypographyTheme.bodyMedium.copyWith(
                color: ColorsTheme.neutralColor[1000],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border.all(
                  color: ColorsTheme.primaryColor,
                ),
                color: ColorsTheme.neutralColor[1000],
              ),
              child: Text(
                "Format : JPG,PNG",
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Method [_documentImage] digunakan untuk mengatur tampilan ketika dokumen sudah dipilih.
  /// Method ini mengembalikan [Column] yang berisi [Container], [MainButton.icon], dan [Text].
  Widget _documentImage() {
    return Column(
      children: [
        Container(
          height: 240,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(controller.selectedFile.value!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        gap(16),
        MainButton.icon(
          label: "Ubah Foto",
          buttonType: ButtonType.outlined,
          icon: FaIcon(
            FontAwesomeIcons.image,
          ),
          onTap: controller.launchGallery,
        ),
      ],
    );
  }
}
