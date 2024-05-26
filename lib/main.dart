import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/themes/main_theme.dart';
import 'package:kostrushapp/res/routes/app_pages.dart';

import 'di/application_module.dart';

// late final PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inisialisasi modul aplikasi.
  ///
  /// Fungsi ini digunakan untuk menginisialisasi modul aplikasi sebelum menjalankan aplikasi utama.
  /// 
  /// Contoh penggunaan:
  /// ```dart
  /// await initApplicationModule();
  /// ```
  await initApplicationModule();

  runApp(const MyApp());
}

/// Kelas MyApp adalah kelas stateful widget yang merupakan bagian dari aplikasi.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
/// Kelas `_MyAppState` adalah kelas yang mengimplementasikan `State` untuk `MyApp`.
/// Kelas ini digunakan untuk membangun tampilan aplikasi menggunakan `GetMaterialApp`.
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MainTheme.lightTheme(context),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
        Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
      ],
    );
  }
}
