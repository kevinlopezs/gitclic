import 'package:get/get.dart';
import 'package:gitclic/main.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  RxBool visibility = false.obs;

  @override
  void onInit() {
    super.onInit();

    //This is for change visibility value after 50 miliseconds
    Future.delayed(50.milliseconds, () => visibility.value = true);

    Future.delayed(500.milliseconds, () {
      _redirect();
    });
  }

  //This is a functions to hanlde user session when app starts
  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);

    //Get current session
    final Session? session = supabase.auth.currentSession;

    //Conditions to handle user session
    if (session?.isExpired == false) {
      //Redirect user to homePage is session is active
      Get.offAllNamed(Approutes.homePage);
    } else {
      //Redirect user to onboardingPage is session was expired
      Get.offAllNamed(Approutes.onboardingPage);
    }
  }
}
