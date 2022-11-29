import 'package:dashboard/ui/dashboard/view/pages/person/user_list_page.dart';
import 'package:dashboard/ui/dashboard/view/pages/search/location_search_page.dart';
import 'package:dashboard/ui/splash/view/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:dashboard/ui/dashboard/binding/dashboard_binding.dart';
import 'package:dashboard/ui/dashboard/view/dashboard_page.dart';

class AppRoutes {
  static const initialRoute = '/splash_page';
  static const dashboardPage = '/dashboard_page';
  static const locationSearchPage = '/locationSearchPage';
  static const userListPage = '/userListPage';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.locationSearchPage,
      page: () => const LocationSearchPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.userListPage,
      page: () => const UserListPage(),
      binding: DashboardBinding(),
    ),
  ];
}
