import 'package:dashboard/app/app_font_weight.dart';
import 'package:dashboard/ui/widgets/common_app_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../app/app_colors.dart';
import '../mail_controller.dart';

// ignore: must_be_immutable
class MailTwo extends StatelessWidget {
  MailTwo({Key? key}) : super(key: key);

  MailController controller = Get.put(MailController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: Get.height / 6,
                    child: Center(
                      child: Text(
                        controller.numberList[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: AppColors.colorBlack,
                    indent: 20,
                    endIndent: 20,
                  );
                },
                itemCount: controller.numberList.length),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CommonAppButton(
              text: "Add",
              onClick: () => controller.addBottomSheet(),
              margin: 5,
            ),
            CommonAppButton(
              text: "Remove",
              onClick: () => controller.removeBottomSheet(),
              margin: 5,
            )
          ],
        )
      ],
    );
  }
}
