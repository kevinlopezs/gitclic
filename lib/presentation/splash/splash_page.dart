import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      id: 'splashPage',
      builder: (_) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Center(
                  child: AnimatedCrossFade(
                    crossFadeState: _.visibility.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Image.asset(
                      'assets/icons/gitclic_icon.png',
                      height: 200,
                      width: 200,
                    ),
                    secondChild: const SizedBox(),
                    duration: 250.milliseconds,
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
