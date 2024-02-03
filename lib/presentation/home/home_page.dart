import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/global_widgets/custom_appbar.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: const ['homePage'],
        builder: (homeController) {
          return Scaffold(
            appBar: CustomAppBar(
              body: SafeArea(
                  child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //This is a card for search engine
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Get.theme.primaryColor.withOpacity(0.01),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        height: 100.h,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text('Search commits..'),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Get.theme.primaryColor,
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {},
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        textAlign: TextAlign.start,
                        'Weekly commits',
                        style: TextStyles.subtitleMedium(),
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
        });
  }
}
