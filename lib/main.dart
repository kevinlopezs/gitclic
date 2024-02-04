import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/models/user_model.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:gitclic/presentation/search/search_controller.dart';
import 'package:gitclic/presentation/themes/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //This is for asyncs functionalities before runApp starts
  WidgetsFlutterBinding.ensureInitialized();

  //This is to setup global file .env in source app
  await dotenv.load(fileName: ".env");

  //Now starts hive manager to store user data
  await Hive.initFlutter();
  if (!Hive.isBoxOpen("user")) await Hive.openBox<UserModel>("user");
  if (!Hive.isBoxOpen("auth")) await Hive.openBox("auth");

  //In this part is neccessart init supabase instance
  //See supabase docs ->
  //https://supabase.com/docs/guides/getting-started/tutorials/with-flutter
  await Supabase.initialize(
    url: dotenv.env['API_URL']!,
    anonKey: dotenv.env['API_KEY']!,
  );

  //We setup the app for only mode portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

//In this part is neccessart init supabase instance
//See supabase docs ->
//https://supabase.com/docs/guides/getting-started/tutorials/with-flutter
final supabase = Supabase.instance.client;

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
        theme: AppTheme(selectedColor: 6, selectedFont: 1).getTheme(),
        initialBinding: BindingsBuilder(() {
          Get.put<HomeController>(HomeController());
          Get.put<SearchPageController>(SearchPageController());
        }),
      ),
    );
  }
}
