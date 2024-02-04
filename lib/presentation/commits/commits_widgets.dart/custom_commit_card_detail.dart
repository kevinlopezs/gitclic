import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../themes/app_text_styles.dart';

class CustomCommitCardDetail extends StatelessWidget {
  const CustomCommitCardDetail({
    super.key,
    required this.size,
    required this.name,
    required this.email,
    required this.date,
    required this.commitType,
  });

  final Size size;
  final String name;
  final String email;
  final DateTime date;
  final String commitType;

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
                            name,
                            style: TextStyles.bodySmall(color: Colors.white),
                          ),
                          const Expanded(child: SizedBox()),
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
                      ),

                      30.verticalSpace,
                      //This is text for email data
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        email,
                        style: TextStyles.bodySmall(color: Colors.white),
                      ),

                      32.verticalSpace,
                      //This is text for date data
                      Text(
                        DateFormat('yyyy-MM-dd HH:mm').format(date),
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
