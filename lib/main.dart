import 'package:dashboard/data/local/database/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/app_class.dart';
import 'app/app_colors.dart';
import 'app/app_routes.dart';

/// void main function
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, widget) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dashboard',
        theme: ThemeData(
          primarySwatch: AppColors.primaryPalette,
        ),
        // builder: (context, widget) => getMainAppViewBuilder(context, widget),
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.initialRoute,
      );
    });
  }

  /// Get main appviewbar
  Widget getMainAppViewBuilder(BuildContext context, Widget? widget) {
    return Stack(
      children: [
        Obx(
          () {
            return IgnorePointer(
              ignoring: AppClass().isShowLoading.isTrue,
              child: Stack(
                children: [
                  widget ?? const Offstage(),
                  if (AppClass().isShowLoading.isTrue) // Top level loading ( used while api calls)
                    ColoredBox(
                      color: AppColors.colorBlack.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
