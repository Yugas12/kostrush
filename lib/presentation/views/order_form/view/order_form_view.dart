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

class OrderFormView extends BaseView<OrderFormController>
    with CustomSliverMixin {
  const OrderFormView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Form Pemesanan",
    );
  }

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
              Column(
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
              const Spacer(),
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
