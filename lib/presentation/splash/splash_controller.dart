import 'package:get/get.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';

class SplashController extends GetxController {
  RxBool visibility = false.obs;

  @override
  void onInit() {
    super.onInit();

    //This is for change visibility value after 50 miliseconds
    Future.delayed(50.milliseconds, () => visibility.value = true);
    //This is for wait 500 miliseconds and redirect when app init by first time
    Future.delayed(
      1000.milliseconds,
      () {
        Get.offAllNamed(Approutes.homePage);
      },
    );
  }
}
