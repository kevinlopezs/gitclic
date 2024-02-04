import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/global_widgets/custom_appbar.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
        id: 'homePage',
        builder: (homeController) {
          return Scaffold(
            appBar: CustomAppBar(
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //This is a card for search engine
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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

                      //Title for weekly commits
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Weekly commits',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are card scrolling for weekly commits
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              //These are card design for weekly commits
                              //This card design is builded with container
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Wednesday 14:00',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.subtitleMediumWhite(),
                                      ),
                                      Text(
                                        '5',
                                        style: TextStyles.titleHigh(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              50.horizontalSpace,
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Friday 14:00',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.subtitleMediumWhite(),
                                      ),
                                      Text(
                                        '3',
                                        style: TextStyles.titleHigh(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              50.horizontalSpace,
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Get.theme.primaryColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Saturday 14:00',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.subtitleMediumWhite(),
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyles.titleHigh(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Title for repositories
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Repositories',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are card scrolling for respositories commits
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              //These are card design for repositories
                              SizedBox(
                                child: Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.15),
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
                                      //This is date information
                                      children: [
                                        //This is repository title
                                        Card(
                                          color: Get.theme.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              '3DClic',
                                              style: TextStyles.titleSmall(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),

                                        //Description subtitle
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            'Description',
                                            style: TextStyles.titleSmall(
                                                color: Get.theme.primaryColor),
                                          ),
                                        ),
                                        //Description text
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            '3DClic is a project where 3d printing users can calculate in one way quickly theirs 3d prints. In addition, users will can see last 3d models in Cults3D and Thingiverse, the most famous platforms for 3d printer models.',
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

                              50.horizontalSpace,

                              SizedBox(
                                child: Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Get.theme.primaryColor
                                        .withOpacity(0.15),
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
                                      //This is date information
                                      children: [
                                        //This is repository title
                                        Card(
                                          color: Get.theme.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              '3DClic',
                                              style: TextStyles.titleSmall(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),

                                        //Description subtitle
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            'Description',
                                            style: TextStyles.titleSmall(
                                                color: Get.theme.primaryColor),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            '3DClic is a project where 3d printing users can calculate in one way quickly theirs 3d prints. In addition, users will can see last 3d models in Cults3D and Thingiverse, the most famous platforms for 3d printer models.',
                                            style: TextStyles.bodySmall(),
                                          ),
                                        ),

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
                      ),

                      //Text button for see more repositories
                      //Title for repositories
                      Padding(
                          padding: EdgeInsets.only(left: size.width * 0.65),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Approutes.searchPage);
                            },
                            child: Text('See more',
                                style: TextStyles.labelSmall(
                                    color: Get.theme.primaryColor)),
                          )),

                      //Title for Latest commits
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 15.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Latest commits',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are card scrolling for latest commits
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              //These are card design for latest commits
                              SizedBox(
                                child: Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color:
                                        Get.theme.primaryColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //This is card for title date
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Get.theme.primaryColorLight
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            boxShadow: [
                                              //This is very important, that shadow has prima
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              '12 Tue',
                                              style: TextStyles.titleSmall(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        50.horizontalSpace,

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //This is text for date and action commit like FEAT
                                              Row(
                                                children: [
                                                  Text(
                                                    '06:46 PM',
                                                    style:
                                                        TextStyles.titleSmall(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
                                                  Card(
                                                    color: Colors.lightGreen,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Text(
                                                        'FEAT',
                                                        style: TextStyles
                                                            .bodySmall(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //This is text for author name
                                              Text(
                                                'Kevin',
                                                style: TextStyles.bodySmall(
                                                    color: Colors.white),
                                              ),
                                              //This is text for repository name
                                              Text(
                                                'Repository: gitclic',
                                                style: TextStyles.bodySmall(
                                                    color: Colors.white),
                                              ),
                                              //5.verticalSpace,
                                              //This is text for repository name
                                              Text(
                                                'Title:',
                                                style: TextStyles.bodySmall(
                                                    color: Colors.white),
                                              ),

                                              //This is text for repository title
                                              Expanded(
                                                child: Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Gitclic app init config with flutter and start building everything',
                                                  style: TextStyles.bodySmall(
                                                      color: Colors.white),
                                                ),
                                              ),

                                              //This is icon for clic option
                                              const Expanded(
                                                child: Row(
                                                  children: [
                                                    Expanded(child: SizedBox()),
                                                    Icon(
                                                      Icons.ads_click,
                                                      color: Colors.black,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              50.horizontalSpace,

                              SizedBox(
                                child: Container(
                                  height: size.height * 0.2,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color:
                                        Get.theme.primaryColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //This is card for title date
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Get.theme.primaryColorLight
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            boxShadow: [
                                              //This is very important, that shadow has prima
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              '12 Tue',
                                              style: TextStyles.titleSmall(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        50.horizontalSpace,

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //This is text for date and action commit like FEAT
                                              Row(
                                                children: [
                                                  Text(
                                                    '06:46 PM',
                                                    style:
                                                        TextStyles.titleSmall(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  const Expanded(
                                                      child: SizedBox()),
                                                  Card(
                                                    color: Colors.green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Text(
                                                        'FEAT',
                                                        style: TextStyles
                                                            .bodySmall(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //This is text for author name
                                              Text(
                                                'Kevin',
                                                style: TextStyles.bodySmall(
                                                    color: Colors.white),
                                              ),
                                              //This is text for repository name
                                              Text(
                                                'Repository: gitclic',
                                                style: TextStyles.bodySmall(
                                                    color: Colors.white),
                                              ),
                                              //5.verticalSpace,
                                              //This is text for repository name
                                              Text(
                                                'Title:',
                                                style: TextStyles.bodySmall(
                                                    color: Colors.white),
                                              ),

                                              //This is text for repository title
                                              Expanded(
                                                child: Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  'Gitclic app init config with flutter and start building everything',
                                                  style: TextStyles.bodySmall(
                                                      color: Colors.white),
                                                ),
                                              ),

                                              //This is icon for clic option
                                              const Expanded(
                                                child: Row(
                                                  children: [
                                                    Expanded(child: SizedBox()),
                                                    Icon(
                                                      Icons.ads_click,
                                                      color: Colors.black,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Text button for see more commits
                      Padding(
                          padding: EdgeInsets.only(left: size.width * 0.65),
                          child: TextButton(
                            onPressed: () {},
                            child: Text('See more',
                                style: TextStyles.labelSmall(
                                    color: Get.theme.primaryColor)),
                          )),
                    ],
                  ),
                ),
              )),
            ),
          );
        });
  }
}
