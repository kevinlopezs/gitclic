import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';
import 'package:gitclic/presentation/themes/app_theme.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Instance for apptheme

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              //This is Lottie animation
              Lottie.asset('assets/animations/onboarding_animation.json'),

              20.verticalSpace,

              //This is onboarding title
              Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Welcome to GitClic',
                    style: TextStyles.titleMedium(),
                    textAlign: TextAlign.center,
                  )),

              20.verticalSpace,

              Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'An APP to check your commit history in GitHub',
                    style: TextStyles.bodySmall(),
                    textAlign: TextAlign.center,
                  )),

              100.verticalSpace,

              //Sign up button
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {
                      //Action to go sign up page
                      Get.toNamed(Approutes.signUpPage);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'Sign up',
                          style: TextStyles.labelLarge(color: Colors.white),
                        ))),
              ),

              10.verticalSpace,
              //Sign in button
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {
                      //Action to go sign in page
                      Get.toNamed(Approutes.signInPage);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      //Apply opacity is important to reduce color weight
                      //when is pressed
                      overlayColor: MaterialStatePropertyAll(
                          AppTheme().buttonColor.withOpacity(0.1)),
                      elevation: const MaterialStatePropertyAll(20.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'Sign in',
                          style: TextStyles.labelLarge(
                            color: AppTheme().buttonColor,
                          ),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
