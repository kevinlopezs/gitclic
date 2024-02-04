import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_controller.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_page.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_recovery_page.dart';
import 'package:gitclic/presentation/auth/sign_up/sign_up_controller.dart';
import 'package:gitclic/presentation/auth/sign_up/sign_up_page.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/home/home_page.dart';
import 'package:gitclic/presentation/onboarding/onboarding_page.dart';
import 'package:gitclic/presentation/search/search_controller.dart';
import 'package:gitclic/presentation/search/search_page.dart';
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

    //Onboarding route
    GetPage(
      name: Approutes.onboardingPage,
      page: () => const OnboardingPage(),
    ),

    //SignUp route
    GetPage(
        name: Approutes.homePage,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeController());
        })),

    //SignIn route
    GetPage(
        name: Approutes.signInPage,
        page: () => const SignInPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignInController());
        })),

    //SignInRecovery route
    GetPage(
        name: Approutes.signInRecoveryPage,
        page: () => const SignInRecoveryPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignInController());
        })),

    //SignUp route
    GetPage(
        name: Approutes.signUpPage,
        page: () => const SignUpPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignUpController());
        })),

    //SearchPage route
    GetPage(
        name: Approutes.searchPage,
        page: () => const SearchPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SearchPageController());
        })),
  ];
}
