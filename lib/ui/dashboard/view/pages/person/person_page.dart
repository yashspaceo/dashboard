import 'package:dashboard/app/app_colors.dart';
import 'package:dashboard/app/app_font_weight.dart';
import 'package:dashboard/app/app_routes.dart';
import 'package:dashboard/ui/dashboard/view/pages/person/person_controller.dart';
import 'package:dashboard/ui/widgets/common_app_button.dart';
import 'package:dashboard/ui/widgets/common_app_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PersonPage extends GetView<PersonController> {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.62,
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryPalette,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: AppFontWeight.extraBold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            color: AppColors.primaryPalette.withOpacity(0.3),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(
                            Icons.camera_alt,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonAppInput(
                    textEditingController: controller.nameController,
                    borderRadius: 10,
                    textInputType: TextInputType.name,
                    hintText: "Full Name",
                    prefixIcon: Icons.person,
                    regExp: RegExp('[a-zA-Z vi]'),
                  ),
                  CommonAppInput(
                    textEditingController: controller.numberController,
                    borderRadius: 10,
                    textInputType: TextInputType.number,
                    hintText: "Number",
                    prefixIcon: Icons.call,
                    regExp: RegExp('[0-9]'),
                    maxLength: 10,
                  ),
                  CommonAppInput(
                    textEditingController: controller.emailController,
                    borderRadius: 10,
                    textInputType: TextInputType.emailAddress,
                    hintText: "Email Address",
                    prefixIcon: Icons.email,
                    blackListRegExp: RegExp(
                        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff]| )'),
                  ),
                  CommonAppInput(
                    textEditingController: controller.passwordController,
                    borderRadius: 10,
                    textInputType: TextInputType.text,
                    hintText: "Password",
                    prefixIcon: Icons.password,
                    isPassword: true,
                    maxLength: 16,
                    blackListRegExp: RegExp(
                        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff]| )'),
                  ),
                  CommonAppButton(
                    text: "Submit",
                    onClick: () {
                      controller.onSubmit();
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CommonAppButton(
                  text: "view user",
                  onClick: () {
                    Get.toNamed(AppRoutes.userListPage);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
