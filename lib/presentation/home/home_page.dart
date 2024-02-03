import 'package:flutter/material.dart';
import 'package:gitclic/presentation/global_widgets/custom_appbar.dart';
import 'package:gitclic/presentation/global_widgets/custom_slide_menu.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(8.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      )),
    );
  }
}
