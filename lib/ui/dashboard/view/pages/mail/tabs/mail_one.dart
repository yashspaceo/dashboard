// ignore_for_file: must_be_immutable

import 'package:dashboard/ui/dashboard/view/pages/mail/mail_controller.dart';
import 'package:dashboard/ui/widgets/common_app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../app/app_colors.dart';

class MailOne extends StatelessWidget {
  MailOne({Key? key}) : super(key: key);

  MailController controller = Get.put(MailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return Center(
          child: SizedBox(
            height: 50.w,
            width: 50.w,
            child: const CircularProgressIndicator(
              strokeWidth: 6,
            ),
          ),
        );
      } else {
        return RefreshIndicator(
          color: Colors.white,
          backgroundColor: AppColors.colorBE002D,
          onRefresh: () async {
            controller.pageIndex = 1;
            controller.getPaginationList();
          },
          child: ListView.separated(
              controller: controller.paginationScrollController,
              itemBuilder: (context, index) {
                // PaginationResponse item = controller.paginationList[index];
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CommonAppImage(
                          imagePath: controller.paginationList[index],
                          height: Get.height / 3,
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (index == controller.paginationList.length - 1)
                      Obx(() {
                        return Center(
                          child: SizedBox(
                            height: 30.w,
                            width: 30.w,
                            child: controller.isMoreLoading.isTrue
                                ? const CircularProgressIndicator(
                                    strokeWidth: 4,
                                  )
                                : const Offstage(),
                          ),
                        );
                      })
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 0);
              },
              itemCount: controller.paginationList.length),
        );
      }
    });
  }
}
