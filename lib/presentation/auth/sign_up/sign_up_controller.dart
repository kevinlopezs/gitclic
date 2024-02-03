import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/services/auth_services.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';

class SignUpController extends GetxController {
  //Variables
  //Global Form key for validations
  final formKey = GlobalKey<FormState>();
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  //Loadign variables
  final RxBool loadingAuth = false.obs;
  final RxBool loadingRedirecting = false.obs;

  //Auth services instances
  AuthServices authServices = AuthServices();

  //This function create a new user
  Future<void> signUp() async {
    try {
      //Init auth loading
      loadingAuth.value = true;

      //Check If email already exist and return(Custom Function in Supabase)
      final response = await authServices.checkEmailExists(email.value);
      if (response == true) {
        //Show snackbar message
        Get.snackbar('Error', 'Email already taken. Try with another email',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);

        //Finish auth loading
        loadingAuth.value = false;
        //Update loading icon
        update(['signUpPage']);
        return;
      }

      //This is for create a new user
      //Is necessary to save user session in supabase
      //See docs https://supabase.com/docs/reference/dart/upgrade-guide
      final responseSignUp = await authServices.signUpNewUser(
        email: email.value,
        pwd: password.value,
      );

      //Handle error if request fails
      if (responseSignUp.statusCode == 200) {
        //Show snackbar message
        Get.snackbar('Success',
            'Please check your email. We sent you a link to activate your account',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);

        //Finish auth loading
        loadingAuth.value = false;
        update();
        //Go to sign in screen
        Get.toNamed(Approutes.signInPage);
      } else {
        //Show snackbar message
        Get.snackbar('Error', responseSignUp.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);

        //Finish auth loading
        loadingAuth.value = false;
      }

      loadingAuth.value = false;
    } catch (error) {
      //Show snackbar message
      Get.snackbar('Error', 'Unexpected error ocurred: $error',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      //Finish auth loading
      loadingAuth.value = false;
    }
  }

  ///Form Validations
  //Email validations
  validateEmail(String? email) {
    if (GetUtils.isNullOrBlank(email ?? '') == true) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(email!)) {
      return 'Email is not valid';
    }
    return null;
  }

  //Password validations
  validatePass(String? pwd) {
    if (GetUtils.isNullOrBlank(pwd ?? '') == true) {
      return 'Password cannot be empty';
    } else if (!GetUtils.isLengthGreaterThan(pwd, 5)) {
      return 'Password cannot be less than 6 characters';
    }
    return null;
  }

  Future onLogin() async {
    if (formKey.currentState!.validate()) {
      return;
    } else {
      Get.snackbar(
          'Error', 'Please check inputs. Email or password are incorrect',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    }
  }
}
