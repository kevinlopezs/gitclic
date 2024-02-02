import 'package:get/get.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/home/home_page.dart';
import 'package:gitclic/presentation/splash/splash_controller.dart';
import 'package:gitclic/presentation/splash/splash_page.dart';
part './app_routes.dart';

//This is the setup with GetX for app routes
abstract class AppPages {
  //Let's create a list to order all app pages
  static final pages = [
    //SplashPage route
    GetPage(
        name: Approutes.splashPage,
        page: () => const SplashPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SplashController());
        })),

    //HomePAge route
    GetPage(
        name: Approutes.homePage,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeController());
        })),
  ];
}
