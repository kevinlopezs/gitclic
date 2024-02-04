import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../themes/app_text_styles.dart';

class CustomCardRepo extends StatelessWidget {
  const CustomCardRepo({
    super.key,
    required this.size,
    required this.repoName,
    required this.repoDescription,
  });

  //Variables
  final Size size;
  final String repoName;
  final String repoDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    //This is date information
                    children: [
                      //This is repository title
                      Card(
                        color: Get.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            repoName,
                            style: TextStyles.titleSmall(color: Colors.white),
                          ),
                        ),
                      ),

                      //Description subtitle
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Description',
                          style: TextStyles.titleSmall(
                              color: Get.theme.primaryColor),
                        ),
                      ),
                      //Description text
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          repoDescription,
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
          ],
        ),
      ),
    );
  }
}
