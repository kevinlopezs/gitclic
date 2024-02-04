import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/commits/commits_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class CommitPage extends StatelessWidget {
  const CommitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<CommitController>(
        id: 'commitPage',
        builder: (commitController) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Icon go back
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 32,
                                color: Get.theme.iconTheme.color,
                              ),
                            ),
                          ),
                          //Title for weekly commits
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Commits list',
                              style: TextStyles.subtitleMedium(),
                            ),
                          ),
                        ],
                      ),

                      //Title for weekly commits
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Repository:',
                              style: TextStyles.subtitleMedium(),
                            ),
                          ),
                          Card(
                            color: Get.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'gitclic',
                                style:
                                    TextStyles.titleSmall(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //These are cards for commits search results
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            //These are card design for commits results
                            SizedBox(
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Get.theme.primaryColor
                                          .withOpacity(0.01),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      //This is a row for title and date search result
                                      Row(
                                        children: [
                                          //This is repository and author title
                                          Card(
                                            color: Get.theme.primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                textAlign: TextAlign.start,
                                                'Repository: gitclic\n Author: kevin',
                                                style: TextStyles.titleTooSmall(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),

                                          const Expanded(child: SizedBox()),
                                          //We wrap the date title with a column for expand to top
                                          Column(
                                            children: [
                                              Text(
                                                '2024-02-01 14:52',
                                                style: TextStyles.titleTooSmall(
                                                    color: Colors.black),
                                              ),
                                              5.verticalSpace,
                                              Card(
                                                color: Colors.lightGreen,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    'FEAT',
                                                    style: TextStyles.bodySmall(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                      //Description text
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'FEAT: Gitclic app init config with flutter\nDescription: Init config for gitclic app using flutter, creating a new project from blank with VSCODE and flutter framework installed in windows.',
                                          style: TextStyles.bodySmall(),
                                        ),
                                      ),

                                      //This is icon for clic option
                                      const Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(child: SizedBox()),
                                            Icon(Icons.ads_click)
                                          ],
                                        ),
                                      )
                                    ],
                                    //This is daily commit counter
                                  ),
                                ),
                              ),
                            ),

                            20.verticalSpace,

                            //These are card design for commits results
                            SizedBox(
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Get.theme.primaryColor
                                          .withOpacity(0.01),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      //This is a row for title and date search result
                                      Row(
                                        children: [
                                          //This is repository and author title
                                          Card(
                                            color: Get.theme.primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                textAlign: TextAlign.start,
                                                'Repository: gitclic\n Author: kevin',
                                                style: TextStyles.titleTooSmall(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),

                                          const Expanded(child: SizedBox()),
                                          //We wrap the date title with a column for expand to top
                                          Column(
                                            children: [
                                              Text(
                                                '2024-02-01 14:52',
                                                style: TextStyles.titleTooSmall(
                                                    color: Colors.black),
                                              ),
                                              5.verticalSpace,
                                              Card(
                                                color: Colors.lightGreen,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    'FEAT',
                                                    style: TextStyles.bodySmall(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),

                                      //Description text
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'FEAT: Gitclic app init config with flutter\nDescription: Init config for gitclic app using flutter, creating a new project from blank with VSCODE and flutter framework installed in windows.',
                                          style: TextStyles.bodySmall(),
                                        ),
                                      ),

                                      //This is icon for clic option
                                      const Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(child: SizedBox()),
                                            Icon(Icons.ads_click)
                                          ],
                                        ),
                                      )
                                    ],
                                    //This is daily commit counter
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
