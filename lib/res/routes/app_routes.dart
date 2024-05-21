part 'app_path.dart';

/// Class ini digunakan untuk menampung semua route yang ada di aplikasi
abstract class AppRoutes {
  AppRoutes._();

  static const splash = _AppPath.splash;
  static const signIn = _AppPath.signIn;
  static const signUp = _AppPath.signUp;
  static const signUpAccount = _AppPath.signUp + _AppPath.account;
  static const success = _AppPath.success;
  static const main = _AppPath.main;
  static const dashboard = _AppPath.main + _AppPath.dashboard;
  static const transaction = _AppPath.main + _AppPath.transaction;
  static const profile = _AppPath.main + _AppPath.profile;
  static const changePassword = _AppPath.changePassword;
  static const editProfile = _AppPath.profile + _AppPath.edit;
  static const detailProfile = _AppPath.profile + _AppPath.detail;
  static const transactionDetail = _AppPath.transaction + _AppPath.detail;
  static const policy = _AppPath.policy;
  static const aboutUs = _AppPath.aboutUs;
  static const helpCenter = _AppPath.helpCenter;
  static const locationResult = _AppPath.location + _AppPath.result;
  static const detailDormitory = _AppPath.dormitory + _AppPath.detail;
  static const orderForm = _AppPath.form + _AppPath.order;
  static const selectDuration = _AppPath.select + _AppPath.duration;
  static const selectedResult = _AppPath.selected + _AppPath.result;
  static const search = _AppPath.search;
}
