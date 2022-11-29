import 'package:dashboard/ui/dashboard/view/dashboard_controller.dart';
import 'package:dashboard/ui/dashboard/view/pages/home/home_controller.dart';
import 'package:dashboard/ui/dashboard/view/pages/mail/mail_controller.dart';
import 'package:dashboard/ui/dashboard/view/pages/person/person_controller.dart';

import 'package:dashboard/ui/dashboard/view/pages/search/search_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MailController());
    Get.lazyPut(() => PersonController());
    Get.lazyPut(() => SearchController());
  }
}
