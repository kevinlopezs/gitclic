import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../themes/app_text_styles.dart';

class CardWeeklyCommitCounter extends StatelessWidget {
  const CardWeeklyCommitCounter({
    super.key,
    required this.weekDay,
    required this.weekHour,
    required this.weekCommitCounter,
  });

  //Variables
  final String weekDay;
  final String weekHour;
  final int weekCommitCounter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            //These are card design for weekly commits
            //This card design is builded with container
            Container(
              decoration: BoxDecoration(
                color: Get.theme.primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '$weekDay $weekHour:00',
                      textAlign: TextAlign.center,
                      style: TextStyles.subtitleMediumWhite(),
                    ),
                    Text(
                      '$weekCommitCounter',
                      style: TextStyles.titleHigh(),
                    ),
                  ],
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
