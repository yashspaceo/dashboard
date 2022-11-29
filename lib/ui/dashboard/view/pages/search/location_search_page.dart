// ignore_for_file: avoid_print

import 'package:dashboard/ui/dashboard/view/pages/search/search_controller.dart';
import 'package:dashboard/ui/widgets/common_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class LocationSearchPage extends GetView<SearchController> {
  const LocationSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: "Search Location"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GooglePlaceAutoCompleteTextField(
              textEditingController: controller.locationSearchController,
              googleAPIKey: "AIzaSyBy6k9YiWAbVwqbHptZi0RUhdo6nNBqKG8",
              inputDecoration: const InputDecoration(hintText: "Search your location"),
              debounceTime: 100,
              countries: const ["in", "fr"],
              isLatLngRequired: true,
              getPlaceDetailWithLatLng: (Prediction prediction) {
                print("placeDetails${prediction.lng}");
              },
              itmClick: (Prediction prediction) {
                controller.locationSearchController.text = prediction.description!;

                controller.locationSearchController.selection =
                    TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                controller.searchOutput.value = controller.locationSearchController.text;

                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
