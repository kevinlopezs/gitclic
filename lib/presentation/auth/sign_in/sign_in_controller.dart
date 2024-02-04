import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/managers/hive_manager.dart';
import 'package:gitclic/data/models/user_session_model.dart';
import 'package:gitclic/data/services/auth_services.dart';
import 'package:gitclic/main.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInController extends GetxController {
  //Variables
  //Global Form key for validations
  final formKey = GlobalKey<FormState>();
  final formKeyPwdRecovery = GlobalKey<FormState>();
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  //Loading variables
  final RxBool loadingAuth = false.obs;
  final RxBool loadingRedirecting = false.obs;
  final RxBool loadingPwdRecovery = false.obs;

  //Pwd recovery Variables
  final formKeyPwdRecoveryPageWithToken = GlobalKey<FormState>();
  final RxString emailRecoveryWithToken = ''.obs;
  final RxString pwdRecoveryWithToken = ''.obs;
  final RxString tokenPwdRecovery = ''.obs;

  //Instace for auth services
  AuthServices authServices = AuthServices();

  //This checks if emails exists in pwd recovery exist
  Future<void> checkEmailExists() async {
    loadingRedirecting.value = true;
    try {
      //Check If email already exist and return
      final response =
          await authServices.checkEmailExists(emailRecoveryWithToken.value);
      if (response == false) {
        Get.snackbar('Error', 'Email does not exists. Try with another email',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingRedirecting.value = false;
      } else {
        //Go to recovery page with token, email and password
        Get.offAndToNamed(Approutes.signInRecoveryPage);
        //Request pwd recovery
        final response =
            await authServices.pwdRecovery(email: emailRecoveryWithToken.value);

        if (response.statusCode == 200) {
          // token was successfully sended to user email
          Get.snackbar('Success',
              'Please check your email and type the token we send you',
              duration: const Duration(seconds: 4),
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP);
          loadingRedirecting.value = false;
        } else {
          Get.snackbar('Error', response.statusMessage ?? '',
              duration: const Duration(seconds: 4),
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP);
          loadingRedirecting.value = false;
          return;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      loadingRedirecting.value = false;
    }
  }

  //Update User Password recovery metadata
  Future<void> updatePwdRecovery(
      {required String email,
      required String token,
      required String newPwd}) async {
    loadingPwdRecovery.value = true;
    try {
      final responseVerifyOTP =
          await authServices.verifyOTPToken(email: email, token: token);

      //User auto login if otp token is okay5
      if (responseVerifyOTP.statusCode == 200) {
        // auto login and save user credentials, token and uid
        final userModel = UserModelSession.fromJson(responseVerifyOTP.data);

        //Use auto login and inmediatly update de user password
        //Save user local with hivemanager
        hiveManager.token = userModel.accessToken;
        hiveManager.user?.id = userModel.user.id;

        final response =
            await authServices.updateUserMetaData(email: email, pwd: newPwd);
        if (response.statusCode == 200) {
          //Save user in hivemanager

          //Save user session online with supabase
          //This is really necessary to save session in supabase
          await supabase.auth.signInWithPassword(
            email: email,
            password: newPwd,
          );
          //Save user session online with supabase
          //This is really necessary to save session in supabase
          Get.snackbar('Success', 'Welcome to GitClic',
              duration: const Duration(seconds: 4),
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP);
          loadingPwdRecovery.value = false;

          Get.offAllNamed(Approutes.homePage);
        }
      } else {
        Get.snackbar('Error', 'Token has expired or is invalid',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingPwdRecovery.value = false;
      }
    } on AuthException catch (error) {
      //This exception is for catch supabase.auth methods
      Get.snackbar('Error', error.message,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingAuth.value = false;
    } catch (e) {
      Get.snackbar('Error', '$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      loadingPwdRecovery.value = false;
    }
  }

  //This create a new user
  Future<void> signIn() async {
    loadingAuth.value = true;
    try {
      //Check If email already exist and return
      final response = await authServices.checkEmailExists(email.value);
      if (response == false) {
        Get.snackbar('Error', 'Email does not exists. Try with another email',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingAuth.value = false;
        return;
      }

      final responseSignIn =
          await authServices.signIn(email: email.value, pwd: password.value);

      if (responseSignIn.statusCode != 200) {
        Get.snackbar('Error', responseSignIn.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingAuth.value = false;
        return;
      }

      final userModel = UserModelSession.fromJson(responseSignIn.data);

      hiveManager.token = userModel.accessToken;
      hiveManager.user?.id = userModel.user.id;

      //Save user session online with supabase
      //This is really necessary to save session in supabase
      await supabase.auth.signInWithPassword(
        email: email.value,
        password: password.value,
      );
      //Save user session online with supabase
      //This is really necessary to save session in supabase

      Get.snackbar('Success', 'Welcome to GitClic',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingAuth.value = false;
      Get.offAllNamed(Approutes.homePage);
    } on AuthException catch (error) {
      //This exception is for catch supabase.auth methods
      Get.snackbar('Error', error.message,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      loadingAuth.value = false;
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error ocurred:$error',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

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

  //token validations
  validateToken(String? token) {
    if (GetUtils.isNullOrBlank(token ?? '') == true) {
      return 'Token cannot be empty';
    } else if (!GetUtils.isLengthEqualTo(token, 6)) {
      return 'Token cannot be less or bigger than 6 characters';
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
