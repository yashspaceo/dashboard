import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AppClass {
  static final AppClass _singleton = AppClass._internal();

  factory AppClass() {
    return _singleton;
  }

  AppClass._internal();
  RxBool isShowLoading = false.obs;

  /// Remove splash screen
  void removeSplash() {
    FlutterNativeSplash.remove();
  }

  /// Show-hide top level loading
  void showLoading(bool value) {
    isShowLoading.value = value;
  }
}
