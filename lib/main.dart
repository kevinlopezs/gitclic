import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';

void main() {
  //This is for asyncs functionalities before runApp starts
  WidgetsFlutterBinding.ensureInitialized();

  //We setup the app for just mode portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner:
            false, //This is for hide debug icon in screen
        getPages: AppPages.pages, //This is for config page in GetX
        initialRoute: Approutes.splashPage, //This is for setup inital page
        initialBinding: BindingsBuilder(() {
          Get.put<HomeController>(HomeController());
        }),
      ),
    );
  }
}
