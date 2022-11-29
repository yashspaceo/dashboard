import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController locationSearchController = TextEditingController();

  RxString searchOutput = "Search Page".obs;
}
