import 'dart:developer';

import 'package:get/get.dart';

import '../../../app/app_class.dart';
import '../../../app/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    AppClass().removeSplash();

    Future.delayed(const Duration(seconds: 2)).then((value)  {
      log('after 2 second');

      Get.offAllNamed(AppRoutes.dashboardPage); // Check if user already logged in
    }); // Get logged in user data
    // checkAppVersion();
  }
}
