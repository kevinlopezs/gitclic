import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/global_widgets/custom_slide_menu.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 135,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  size: 28,
                  color: Get.theme.primaryColor,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text('Hi kevin', style: TextStyles.titleMedium()),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/gitclic_icon.png'),
              backgroundColor: Colors.white,
              maxRadius: 18.0,
            ),
          )
        ],
      ),
      drawer: const SlideMenu(),
      body: body,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(10.sh);
}
