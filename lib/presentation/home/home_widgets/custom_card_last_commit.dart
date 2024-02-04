import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../themes/app_text_styles.dart';

class CustomCardLastCommit extends StatelessWidget {
  const CustomCardLastCommit({
    super.key,
    required this.size,
    required this.commitDate,
    required this.commiterName,
    required this.repoName,
    required this.commitDescription,
    required this.commitType,
  });

  final Size size;
  final DateTime commitDate;
  final String commiterName;
  final String repoName;
  final String commitDescription;
  final String commitType;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  color: Get.theme.primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //This is card for title date
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
                            DateFormat('d EEEE').format(commitDate),
                            style: TextStyles.titleSmall(color: Colors.white),
                          ),
                        ),
                      ),
                      50.horizontalSpace,

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //This is text for date and action commit like FEAT
                            Row(
                              children: [
                                Text(
                                  DateFormat('HH:mm').format(commitDate),
                                  style: TextStyles.titleSmall(
                                      color: Colors.white),
                                ),
                                const Expanded(child: SizedBox()),
                                Card(
                                  color: Colors.lightGreen,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      commitType,
                                      style: TextStyles.bodySmall(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //This is text for author name
                            Text(
                              commiterName,
                              style: TextStyles.bodySmall(color: Colors.white),
                            ),
                            //This is text for repository name
                            Text(
                              'Repository: $repoName',
                              style: TextStyles.bodySmall(color: Colors.white),
                            ),
                            //5.verticalSpace,
                            //This is text for repository name
                            Text(
                              'Title:',
                              style: TextStyles.bodySmall(color: Colors.white),
                            ),

                            //This is text for repository title
                            Expanded(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                commitDescription,
                                style:
                                    TextStyles.bodySmall(color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
