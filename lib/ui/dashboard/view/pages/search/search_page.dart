import 'package:dashboard/app/app_font_weight.dart';
import 'package:dashboard/app/app_routes.dart';
import 'package:dashboard/ui/dashboard/view/pages/search/search_controller.dart';
import 'package:dashboard/ui/widgets/common_app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  ("${controller.searchOutput}"),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: AppFontWeight.medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CommonAppButton(
                text: "Select Location",
                onClick: () {
                  controller.locationSearchController.clear();
                  Get.toNamed(AppRoutes.locationSearchPage);

                },
                margin: 2,
                width: 200,
              ),
            ],
          ),
        );
      },
    );
  }
}
