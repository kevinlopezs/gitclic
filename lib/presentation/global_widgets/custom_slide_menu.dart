import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(children: [
      Text(
        textAlign: TextAlign.center,
        'Hi kevin',
        style: TextStyles.titleSmall(),
      ),
      20.verticalSpace,
      const NavigationDrawerDestination(
        icon: Icon(Icons.person),
        label: Text('My profile'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.person),
        label: Text('My profile'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.logout_rounded),
        label: Text('Sign out'),
      ),
    ]);
  }
}
