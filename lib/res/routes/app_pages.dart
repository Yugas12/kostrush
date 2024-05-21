import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../presentation/views/about_us/binding/about_us_binding.dart';
import '../../presentation/views/about_us/view/about_us_view.dart';
import '../../presentation/views/account_sign_up/binding/account_sign_up_binding.dart';
import '../../presentation/views/account_sign_up/view/account_sign_up_view.dart';
import '../../presentation/views/change_password/binding/change_password_binding.dart';
import '../../presentation/views/change_password/view/change_password_view.dart';
import '../../presentation/views/detail_dormitory/binding/detail_dormitory_binding.dart';
import '../../presentation/views/detail_dormitory/view/detail_dormitory_view.dart';
import '../../presentation/views/detail_profile/binding/detail_profile_binding.dart';
import '../../presentation/views/detail_profile/view/detail_profile_view.dart';
import '../../presentation/views/detail_transaction/binding/detail_transaction_binding.dart';
import '../../presentation/views/detail_transaction/view/detail_transaction_view.dart';
import '../../presentation/views/duration_selector/binding/duration_selector_binding.dart';
import '../../presentation/views/duration_selector/view/duration_selector_view.dart';
import '../../presentation/views/edit_profile/binding/edit_profile_binding.dart';
import '../../presentation/views/edit_profile/view/edit_profile_view.dart';
import '../../presentation/views/help_center/binding/help_center_binding.dart';
import '../../presentation/views/help_center/view/help_center_view.dart';
import '../../presentation/views/location_result/binding/location_result_binding.dart';
import '../../presentation/views/location_result/view/location_result_view.dart';
import '../../presentation/views/main/binding/main_binding.dart';
import '../../presentation/views/main/tabs/dashboard/binding/dashboard_binding.dart';
import '../../presentation/views/main/tabs/dashboard/view/dashboard_view.dart';
import '../../presentation/views/main/tabs/profile/binding/profile_binding.dart';
import '../../presentation/views/main/tabs/profile/view/profile_view.dart';
import '../../presentation/views/main/tabs/transaction/binding/transaction_binding.dart';
import '../../presentation/views/main/tabs/transaction/view/transaction_view.dart';
import '../../presentation/views/main/view/main_view.dart';
import '../../presentation/views/order_form/binding/order_form_binding.dart';
import '../../presentation/views/order_form/view/order_form_view.dart';
import '../../presentation/views/policy/binding/policy_binding.dart';
import '../../presentation/views/policy/view/policy_view.dart';
import '../../presentation/views/search/binding/search_binding.dart';
import '../../presentation/views/search/view/search_view.dart';
import '../../presentation/views/selected_result/binding/selected_result_binding.dart';
import '../../presentation/views/selected_result/view/selected_result_view.dart';
import '../../presentation/views/sign_in/binding/sign_in_binding.dart';
import '../../presentation/views/sign_in/view/sign_in_view.dart';
import '../../presentation/views/sign_up/binding/sign_up_binding.dart';
import '../../presentation/views/sign_up/view/sign_up_view.dart';
import '../../presentation/views/splash/binding/splash_binding.dart';
import '../../presentation/views/splash/view/splash_view.dart';
import '../../presentation/views/success/binding/success_binding.dart';
import '../../presentation/views/success/view/success_view.dart';

/// Class ini digunakan untuk menampung semua route yang ada di aplikasi
class AppPages {
  AppPages._();

  /// Initial route
  static const String initial = AppRoutes.splash;

  /// List of routes
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpAccount,
      page: () => const AccountSignUpView(),
      binding: AccountSignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.success,
      page: () => const SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainView(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: AppRoutes.dashboard,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: AppRoutes.transaction,
          page: () => const TransactionView(),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        )
      ],
    ),
    GetPage(
      name: AppRoutes.locationResult,
      page: () => const LocationResultView(),
      binding: LocationResultBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.detailProfile,
      page: () => const DetailProfileView(),
      binding: DetailProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.policy,
      page: () => const PolicyView(),
      binding: PolicyBinding(),
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: AppRoutes.helpCenter,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: AppRoutes.detailDormitory,
      page: () => const DetailDormitoryView(),
      binding: DetailDormitoryBinding(),
    ),
    GetPage(
      name: AppRoutes.orderForm,
      page: () => const OrderFormView(),
      binding: OrderFormBinding(),
    ),
    GetPage(
      name: AppRoutes.selectDuration,
      page: () => const DurationSelectorView(),
      binding: DurationSelectorBinding(),
    ),
    GetPage(
      name: AppRoutes.transactionDetail,
      page: () => const DetailTransactionView(),
      binding: DetailTransactionBinding(),
    ),
    GetPage(
      name: AppRoutes.selectedResult,
      page: () => const SelectedResultView(),
      binding: SelectedResultBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
    )
  ];
}
