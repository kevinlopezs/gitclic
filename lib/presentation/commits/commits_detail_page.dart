import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/commits/commits_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class CommitDetailPage extends StatelessWidget {
  const CommitDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<CommitController>(
        id: 'commitDetailPage',
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
                          //Title for commit detail
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Commit detail',
                              style: TextStyles.subtitleMedium(),
                            ),
                          ),
                        ],
                      ),

                      //Title for author commit data
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            textAlign: TextAlign.right,
                            'Author',
                            style: TextStyles.subtitleMedium(),
                          ),
                        ),
                      ),

                      10.verticalSpace,

                      //These are card design for author  data
                      CustomCommitCardDetail(size: size),

                      10.verticalSpace,

                      //Title for Commiter  data
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            textAlign: TextAlign.right,
                            'Commiter',
                            style: TextStyles.subtitleMedium(),
                          ),
                        ),
                      ),

                      10.verticalSpace,

                      //These are card design for commiter data
                      CustomCommitCardDetail(size: size),

                      10.verticalSpace,

                      //Title for Commit  title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            textAlign: TextAlign.right,
                            'Commit',
                            style: TextStyles.subtitleMedium(),
                          ),
                        ),
                      ),

                      //This is text for commit description
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'FEAT: Gitclic app init config with flutter\nDescription: Init config for gitclic app using flutter, creating a new project from blank with VSCODE and flutter framework installed in windows.',
                            style: TextStyles.bodySmall(),
                          ),
                        ),
                      ),

                      10.verticalSpace,

                      //Title for Commit stats
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            textAlign: TextAlign.right,
                            'Stats',
                            style: TextStyles.subtitleMedium(),
                          ),
                        ),
                      ),

                      10.verticalSpace,

                      //These are card scrolling for commit stats
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
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

                      10.verticalSpace,

                      //Title for Commit comments
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Text(
                                textAlign: TextAlign.right,
                                'Comments',
                                style: TextStyles.subtitleMedium(
                                    color: Get.theme.primaryColor),
                              ),
                              const Expanded(child: SizedBox()),
                              Card(
                                color: Get.theme.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    textAlign: TextAlign.right,
                                    'Total comments: 2',
                                    style: TextStyles.titleSmall(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      10.verticalSpace,
                      //this is one comment
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              //Avatar
                              const Padding(
                                padding: EdgeInsets.only(right: 30.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/icons/gitclic_icon.png'),
                                  backgroundColor: Colors.white,
                                  maxRadius: 18.0,
                                ),
                              ),
                              //Comment data
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('January 25, 2024',
                                        style: TextStyles.titleSmall()),
                                    const Text(
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        'There’s some bug before create apk'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      10.verticalSpace,

                      //this is one comment
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              //Avatar
                              const Padding(
                                padding: EdgeInsets.only(right: 30.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/icons/gitclic_icon.png'),
                                  backgroundColor: Colors.white,
                                  maxRadius: 18.0,
                                ),
                              ),
                              //Comment data
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('January 25, 2024',
                                        style: TextStyles.titleSmall()),
                                    const Text(
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        'There’s some bug before create apk'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CustomCommitCardDetail extends StatelessWidget {
  const CustomCommitCardDetail({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: size.height * 0.22,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Get.theme.primaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //This is colum card for author data
              //Author name
              //Author email
              //Author Date
              Column(
                children: [
                  //This is text author commit card
                  Container(
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColorLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        //This is very important, that shadow has primary
                        BoxShadow(
                          color: Get.theme.primaryColor.withOpacity(0.01),
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
                        'Name:',
                        style: TextStyles.titleSmall(color: Colors.white),
                      ),
                    ),
                  ),

                  10.verticalSpace,

                  //This is text email commit card
                  Container(
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColorLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        //This is very important, that shadow has prima
                        BoxShadow(
                          color: Get.theme.primaryColor.withOpacity(0.01),
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
                        'Email:',
                        style: TextStyles.titleSmall(color: Colors.white),
                      ),
                    ),
                  ),

                  10.verticalSpace,

                  //This is text Date commit card
                  Container(
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColorLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        //This is very important, that shadow has prima
                        BoxShadow(
                          color: Get.theme.primaryColor.withOpacity(0.01),
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
                        'Date:',
                        style: TextStyles.titleSmall(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              50.horizontalSpace,

              //this is column for author data
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Kevin',
                            style: TextStyles.bodySmall(color: Colors.white),
                          ),
                          const Expanded(child: SizedBox()),
                          Card(
                            color: Colors.lightGreen,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'FEAT',
                                style:
                                    TextStyles.bodySmall(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      30.verticalSpace,
                      //This is text for email data
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        'kevinlopezs15@gmail.com',
                        style: TextStyles.bodySmall(color: Colors.white),
                      ),

                      32.verticalSpace,
                      //This is text for email data
                      Text(
                        'Kevin',
                        style: TextStyles.bodySmall(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
