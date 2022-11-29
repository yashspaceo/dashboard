import 'package:dashboard/app/app_colors.dart';
import 'package:dashboard/app/app_font_weight.dart';
import 'package:dashboard/ui/widgets/common_app_image.dart';
import 'package:dashboard/ui/dashboard/view/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue ? getShimmerView() : getGridView(),
    );
  }

  ///[getRatingButton] is used to show rating button
  Widget getRatingButton(int index, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: AppColors.primaryPalette, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Text(("${controller.productList[index].rating?.rate ?? ''}"),
                style: TextStyle(color: AppColors.colorWhite, fontSize: 14, fontWeight: AppFontWeight.medium)),
            const SizedBox(width: 3),
            const Icon(Icons.star, color: AppColors.colorWhite, size: 16)
          ],
        ),
      ),
    );
  }

  ///[getPriceButton] is used to show price button
  Widget getPriceButton(int index, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: AppColors.primaryPalette, borderRadius: BorderRadius.circular(5)),
        child: RichText(
          text: TextSpan(
            text: "\$ ",
            style: TextStyle(color: AppColors.colorWhite, fontSize: 18, fontWeight: AppFontWeight.medium),
            children: [
              TextSpan(
                  text: ("${controller.productList[index].price ?? ''}"),
                  style: TextStyle(color: AppColors.colorWhite, fontSize: 16, fontWeight: AppFontWeight.medium)),
            ],
          ),
        ),
      ),
    );
  }

  ///[getGridItem] is used to load grid view item
  Widget getGridItem(int index) {
    return Card(
      shadowColor: AppColors.primaryPalette.withOpacity(0.25),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: CommonAppImage(
                imagePath: controller.productList[index].image ?? '',
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              controller.productList[index].title ?? '',
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: AppFontWeight.medium),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getRatingButton(index, () {}),
                getPriceButton(index, () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///[getGridView] is used to show grid view
  Widget getGridView() {
    return Obx(
      () => controller.productList.isEmpty
          ? const Center(child: Text('No Data Found'))
          : GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (_, index) {
                return getGridItem(index);
              },
            ),
    );
  }

  ///[getShimmerView] is used to show shimmer
  Widget getShimmerView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Card();
        },
      ),
    );
  }
}
