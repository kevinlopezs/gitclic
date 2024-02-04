import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';
import 'package:intl/intl.dart';

class CustomCardCommit extends StatelessWidget {
  const CustomCardCommit({
    super.key,
    required this.size,
    required this.repoName,
    required this.authorName,
    required this.commitDescription,
    required this.commitType,
    required this.commitDate,
  });
  //Variables
  final Size size;
  final String repoName;
  final String authorName;
  final String commitDescription;
  final String commitType;
  final DateTime commitDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //These are card design for commits results
          SizedBox(
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.8,
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    //This is a row for title and date search result
                    Row(
                      children: [
                        //This is repository and author title
                        Card(
                          color: Get.theme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Repository: $repoName\n Author: $authorName',
                              style:
                                  TextStyles.titleTooSmall(color: Colors.white),
                            ),
                          ),
                        ),

                        const Expanded(child: SizedBox()),
                        //We wrap the date title with a column for expand to top
                        Column(
                          children: [
                            Text(
                              DateFormat('yyyy-MM-dd').format(commitDate),
                              style:
                                  TextStyles.titleTooSmall(color: Colors.black),
                            ),
                            5.verticalSpace,
                            Card(
                              color: Colors.lightGreen,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  commitType,
                                  style:
                                      TextStyles.bodySmall(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    //Description text
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        commitDescription,
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
        ],
      ),
    );
  }
}
