// ignore_for_file: must_be_immutable

import 'package:dashboard/app/app_colors.dart';
import 'package:dashboard/ui/splash/view/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView {
  @override
  SplashController controller = Get.put(SplashController());

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blue.withOpacity(0.2),
        body: Center(
          child: Text(
            "welCome!",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.colorBE002D,
            ),
          ),
        ),
      ),
    );
  }
}
