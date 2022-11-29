// import 'dart:convert';
import 'package:dashboard/ui/dashboard/view/pages/home/model/product_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<Product> productList = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchProduct();
    getToken();
  }

  /// Fetch Product data from api
  // void fetchProduct() async {
  //   isLoading.value = true;
  //   final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
  //   isLoading.value = false;
  //
  //   if (response.statusCode == 200) {
  //     List<Product> list =
  //         (jsonDecode(response.body) as List<dynamic>).map<Product>((value) => Product.fromJson(value)).toList();
  //     productList.assignAll(list);
  //   } else {
  //     throw Exception(
  //       'Failed to load Product data..',
  //     );
  //   }
  // }

  Future<String> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint('FCM token: $token');
    return token ?? '';
  }
}
