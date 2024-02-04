import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../themes/app_text_styles.dart';

class CustomCommitStatsCard extends StatelessWidget {
  const CustomCommitStatsCard({
    super.key,
    required this.total,
    required this.additions,
    required this.deletions,
  });

  final int total;
  final int additions;
  final int deletions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
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
                      'Total',
                      textAlign: TextAlign.center,
                      style: TextStyles.subtitleMediumWhite(),
                    ),
                    Text(
                      '$total',
                      style: TextStyles.titleHigh(),
                    ),
                  ],
                ),
              ),
            ),
            50.horizontalSpace,
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
                      'Additions',
                      textAlign: TextAlign.center,
                      style: TextStyles.subtitleMediumWhite(),
                    ),
                    Text(
                      '$additions',
                      style: TextStyles.titleHigh(),
                    ),
                  ],
                ),
              ),
            ),
            50.horizontalSpace,
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
                      'Deletions',
                      textAlign: TextAlign.center,
                      style: TextStyles.subtitleMediumWhite(),
                    ),
                    Text(
                      '$deletions',
                      style: TextStyles.titleHigh(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
