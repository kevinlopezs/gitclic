import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class SlideMenu extends StatefulWidget {
  const SlideMenu({super.key});

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  //This is to control the slide menu item selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'slideMenu',
        builder: (homeController) {
          return NavigationDrawer(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });

                if (selectedIndex == 0) {
                  homeController.signOut();
                }
              },
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Hi kevin',
                  style: TextStyles.titleSmall(),
                ),
                20.verticalSpace,
                NavigationDrawerDestination(
                  enabled: true,
                  icon:
                      //Add a condition to show loading icon if signout is not finished
                      homeController.loadingSignOut.value == true
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.logout_rounded),
                  label: const Text('Sign out'),
                ),
              ]);
        });
  }
}
