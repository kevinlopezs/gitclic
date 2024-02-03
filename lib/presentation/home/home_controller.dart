import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/managers/hive_manager.dart';
import 'package:gitclic/data/services/auth_services.dart';
import 'package:gitclic/main.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  //Variable for use auth services
  AuthServices authServices = AuthServices();

  //Loading variables
  final RxBool loadingSignOut = false.obs;

  //This is a function for sign out user session
  Future<void> signOut() async {
    try {
      //Start loading sign out
      loadingSignOut.value = true;

      //Is necessary to save close user session in supabase
      //See docs https://supabase.com/docs/reference/dart/upgrade-guide
      final response = await authServices.signOut();
      await supabase.auth.signOut();

      //Condition when session is closed successfully
      if (response.statusCode == 204) {
        //Show successfully snackbar
        Get.snackbar('OK', 'Session closed successfully',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);

        //Finish loading sign out
        loadingSignOut.value = false;
        //Update slideMenu to change loading icon in sign out option
        update(['slideMenu']);

        //Is necessary close session in local hivemanager too
        hiveManager.signOut();

        //Close all pages and redirect the user to onboarding page
        Get.offAllNamed(Approutes.onboardingPage);
      }
    } on AuthException catch (error) {
      //This exception is for catch supabase.auth methods
      //Show snackbar error
      Get.snackbar('Error', error.message,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      //Finish loading sign out
      loadingSignOut.value = false;
      //Update slideMenu to change loading icon in sign out option
      update(['slideMenu']);

      //Is necessary close session in local hivemanager too
      hiveManager.signOut();
    } catch (e) {
      //Show snackbar error
      Get.snackbar('Error', '$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      //Finish loading sign out
      loadingSignOut.value = false;

      //Update slideMenu to change loading icon in sign out option
      update(['slideMenu']);

      //Is necessary close session in local hivemanager too
      hiveManager.signOut();
    }
  }
}
