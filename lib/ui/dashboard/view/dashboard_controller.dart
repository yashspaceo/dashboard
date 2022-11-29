import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt bottomNavigationIndex = 0.obs;
  PageController dashboardPageController = PageController();

  /// Page change in bottom navigation bar
  void onPageChange(int index) {
    dashboardPageController.jumpToPage(index);

    bottomNavigationIndex.value = index;
  }
}
