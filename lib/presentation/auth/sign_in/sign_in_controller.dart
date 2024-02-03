import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
