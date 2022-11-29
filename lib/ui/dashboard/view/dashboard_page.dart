import 'package:dashboard/ui/dashboard/view/dashboard_controller.dart';
import 'package:dashboard/ui/dashboard/view/pages/home/home_page.dart';
import 'package:dashboard/ui/dashboard/view/pages/mail/mail_page.dart';
import 'package:dashboard/ui/dashboard/view/pages/person/person_page.dart';
import 'package:dashboard/ui/dashboard/view/pages/search/search_page.dart';
import 'package:dashboard/ui/widgets/common_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/app_colors.dart';
import '../../../app/app_font_weight.dart';

import '../../../generated/locales.g.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Obx(
            () => CommonAppBar(
              titleText: controller.bottomNavigationIndex.value == 0
                  ? 'Home'
                  : controller.bottomNavigationIndex.value == 1
                      ? 'Mail'
                      : controller.bottomNavigationIndex.value == 2
                          ? 'Search'
                          : "Register",
            ),
          ),
        ),
        body: getPageView(),
        bottomNavigationBar: getBottomNavigationView(),
      ),
    );
  }

  /// Create page view with all pages
  Widget getPageView() {
    return PageView(
      controller: controller.dashboardPageController,
      onPageChanged: (index) => controller.onPageChange(index),
      physics: const NeverScrollableScrollPhysics(),
      pageSnapping: true,
      children: const [
        HomePage(),
        MailPage(),
        SearchPage(),
        PersonPage(),
      ],
    );
  }

  /// Create bottom navigation view
  Widget getBottomNavigationView() {
    return Obx(
      () => BottomNavigationBar(
        elevation: 6,
        currentIndex: controller.bottomNavigationIndex.value,
        backgroundColor: AppColors.colorBE002D,
        selectedItemColor: AppColors.colorBlack,
        unselectedItemColor: AppColors.colorCBCBCB,
        onTap: (int index) => controller.onPageChange(index),
        selectedLabelStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: AppFontWeight.regular),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: AppFontWeight.regular),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: LocaleKeys.home.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.contact_mail),
            label: LocaleKeys.mail.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: LocaleKeys.search.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: LocaleKeys.person.tr,
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.bubble_chart),
          //   label: LocaleKeys.database.tr,
          // ),
        ],
      ),
    );
  }
}
