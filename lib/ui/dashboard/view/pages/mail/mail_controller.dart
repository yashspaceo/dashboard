import 'dart:math';

import 'package:dashboard/app/app_colors.dart';
import 'package:dashboard/ui/widgets/common_app_bottomsheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MailController extends GetxController with GetSingleTickerProviderStateMixin {
  RxList<String> paginationList = <String>[].obs;
  RxList<String> numberList = <String>[].obs;
  int pageIndex = 1;
  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;
  bool isPaginationOver = false;
  ScrollController paginationScrollController = ScrollController();
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    getPaginationList();
    setPaginationScroll();
  }

  /// Get pagination list from api calls
  void getPaginationList() async {
    pageIndex == 1 ? isLoading.value = true : isMoreLoading.value = true;
    //todo this below api is used only for demo purpose, replace with your own project api

    var list = [
      'https://images.pexels.com/photos/39693/motorcycle-racer-racing-race-speed-39693.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2393816/pexels-photo-2393816.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/9266562/pexels-photo-9266562.jpeg?cs=srgb&dl=pexels-rahul-soni-9266562.jpg&fm=jpg',
      'https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75'
          'https://media.istockphoto.com/id/859916128/photo/truck-driving-on-the-asphalt-road-in-rural-landscape-at-sunset-with-dark-clouds.jpg?s=612x612&w=0&k=20&c=tGF2NgJP_Y_vVtp4RWvFbRUexfDeq5Qrkjc4YQlUdKc=',
    ];
    isPaginationOver = false;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    isMoreLoading.value = false;
    pageIndex == 1 ? paginationList.assignAll(list) : paginationList.addAll(list);
  }

  /// Set pagination scroll listener for listview to detect end of list view
  void setPaginationScroll() {
    paginationScrollController.addListener(() {
      if (paginationScrollController.position.pixels == paginationScrollController.position.maxScrollExtent &&
          isMoreLoading.isFalse &&
          !isPaginationOver) {
        pageIndex++;
        getPaginationList();
      }
    });
  }

  // var randomList = [
  //   'https://images.pexels.com/photos/39693/motorcycle-racer-racing-race-speed-39693.jpeg?auto=compress&cs=tinysrgb&w=600',
  //   'https://images.pexels.com/photos/2393816/pexels-photo-2393816.jpeg?auto=compress&cs=tinysrgb&w=600',
  //   'https://images.pexels.com/photos/9266562/pexels-photo-9266562.jpeg?cs=srgb&dl=pexels-rahul-soni-9266562.jpg&fm=jpg',
  //   'https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75'
  //       'https://media.istockphoto.com/id/859916128/photo/truck-driving-on-the-asphalt-road-in-rural-landscape-at-sunset-with-dark-clouds.jpg?s=612x612&w=0&k=20&c=tGF2NgJP_Y_vVtp4RWvFbRUexfDeq5Qrkjc4YQlUdKc=',
  // ];

  /// Bottom Sheet to add a number
  void addBottomSheet() {
    Get.bottomSheet(
      CommonBottomSheet(
        title: 'Add',
        option1Text: 'Add to Top',
        option2Text: 'Add to Bottom',
        onTapOption1: () {
          numberList.insert(0, Random().nextInt(100).toString());
          numberList.value = numberList.toSet().toList();
          Get.back();
        },
        onTapOption2: () {
          numberList.add(Random().nextInt(100).toString());
          numberList.value = numberList.toSet().toList();
          Get.back();
        },
      ),
    );
  }

  /// Bottom Sheet to remove a number
  void removeBottomSheet() {
    Get.bottomSheet(
      CommonBottomSheet(
        title: 'Remove',
        option1Text: 'Remove from Top',
        option2Text: 'Remove from Bottom',
        onTapOption1: () {
          Get.back();
          Get.defaultDialog(
            title: "Confirmation",
            middleText: "Are you sure want to Remove?",
            textConfirm: "Yes",
            textCancel: "No",
            buttonColor: AppColors.primaryPalette,
            cancelTextColor: AppColors.primaryPalette,
            confirmTextColor: AppColors.colorWhite,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              if (numberList.isNotEmpty) {
                numberList.removeAt(0);
              }
              Get.back();
            },
          );
        },
        onTapOption2: () {
          Get.back();
          Get.defaultDialog(
            title: "Confirmation",
            middleText: "Are you sure want to Remove?",
            textConfirm: "Yes",
            textCancel: "No",
            buttonColor: AppColors.primaryPalette,
            cancelTextColor: AppColors.primaryPalette,
            confirmTextColor: AppColors.colorWhite,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              if (numberList.isNotEmpty) {
                numberList.removeLast();
              }
              Get.back();
            },
          );
        },
      ),
    );
  }
}
