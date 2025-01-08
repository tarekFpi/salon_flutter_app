import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salon_booking_app/core/app_routes/app_routes.dart';
import 'package:salon_booking_app/core/dependency/dependency_injection.dart';
import 'package:salon_booking_app/service/socket_service.dart';
import 'package:salon_booking_app/utils/app_colors/app_colors.dart';
import 'package:salon_booking_app/view/components/device_utils/device_utils.dart';
import 'package:salon_booking_app/view/multi_lag/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  SocketApi.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));

  await GetStorage.init();

  configLoading();

  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..backgroundColor = AppColors.piClr6
    ..indicatorColor = AppColors.piClr6
    ..textColor = AppColors.piClr6
    ..maskColor = Colors.white.withOpacity(0.8);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        // ignore: prefer_if_null_operators
        locale: Locale(
            "${storage.read("key") == null ? "en" : storage.read("key")}",
            storage.read("key") == null ? "US" : "AE"),
        translations: AppTranslations(),
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
                surfaceTintColor: AppColors.softlimegreen,
                toolbarHeight: 65,
                elevation: 0,
                centerTitle: true,
                backgroundColor: AppColors.white,
                iconTheme: IconThemeData(color: AppColors.white))),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoutes.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoutes.routes,
        builder: EasyLoading.init(),
      ),
    );
  }
}
