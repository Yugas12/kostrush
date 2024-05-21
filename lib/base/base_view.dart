import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';

import '../presentation/components/container/progress_container.dart';
import 'base_controller.dart';

/// BaseView adalah class yang digunakan untuk membuat view yang memiliki konsep state management dengan menggunakan GetX.
/// Class ini memiliki beberapa method yang digunakan untuk membuat view dengan konsep enkapsulasi.
/// Class ini membutuhkan controller yang diimplementasikan dari BaseController.
abstract class BaseView<T extends BaseController> extends GetView<T> {
  const BaseView({super.key});

  /// Method ini digunakan untuk membuat body dari view
  Widget body(BuildContext context, dynamic state);

  /// Method ini digunakan untuk membuat extend view
  bool? extendBody() {
    return false;
  }

  /// Method ini digunakan untuk membuat appbar
  PreferredSizeWidget? appBar(BuildContext context);

  /// Method ini digunakan untuk membuat drawer
  Widget? drawer() {
    return null;
  }

  /// Method ini digunakan untuk membuat bottom navigation bar
  Widget? bottomNavigationBar() {
    return null;
  }

  /// Method ini digunakan untuk membuat floating action button
  Widget? floatingActionButton() {
    return null;
  }

  /// Method ini digunakan untuk membuat loading widget
  Widget? loadingWidget() {
    return null;
  }

  /// Method ini digunakan untuk mengatur warna background
  Color? backgroundColor({Color? color}) {
    return color ?? ColorsTheme.neutralColor[1000];
  }

  /// Method ini digunakan untuk mengatur on try again
  VoidCallback? onTryAgain() {
    onRefresh();
  }

  /// Method ini digunakan untuk melakukan refresh pada view
  Future<void> onRefresh() async {
    controller.onRefresh();
  }

  /// Method ini digunakan untuk membuat page content dengan konsep enkapsulasi
  Widget _pageContent(BuildContext context) {
    return SafeArea(
      child: controller.obx(
        (state) => body(context, state),
        onLoading: ProgressContainer(
          isShow: true,
          onDismiss: null,
          customWidget: loadingWidget(),
        ),
        onEmpty: _body(context),
        // onError: (error) => ErrorContainer(
        //   message: error,
        //   onTryAgain: () {
        //     controller.onRefresh();
        //   },
        // ),
        onError: (error) {
          return errorContainer(error ?? "Terjadi kesalahan");
        },
      ),
    );
  }

  Widget errorContainer(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          TextButton(
            onPressed: () {
              onTryAgain();
            },
            child: const Text("Coba Lagi"),
          ),
        ],
      ),
    );
  }

  /// Method ini digunakan untuk membuat body dengan konsep enkapsulasi
  Widget _body(BuildContext context) => body(context, null);

  /// Method ini digunakan untuk membuat extend page content dengan konsep enkapsulasi
  Widget _extendPageContent(BuildContext context) {
    return controller.obx(
      (state) => body(context, state),
      onLoading: ProgressContainer(
        isShow: true,
        onDismiss: null,
        customWidget: loadingWidget(),
      ),
      onEmpty: _body(context),
      onError: (error) => const SizedBox(),
    );
  }

  /// Method ini digunakan untuk membuat view dari default flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: extendBody()! ? _extendPageContent(context) : _pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: drawer(),
      extendBodyBehindAppBar: extendBody()!,
    );
  }
}
