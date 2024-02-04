import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/app_text_styles.dart';

class CustomCommentWidget extends StatelessWidget {
  const CustomCommentWidget({
    super.key,
    required this.avatarUrl,
    required this.date,
    required this.description,
  });

  final String avatarUrl;
  final DateTime date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            //Avatar
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                backgroundColor: Colors.white,
                maxRadius: 18.0,
              ),
            ),
            //Comment data
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('MMMM d, yyyy').format(date),
                      style: TextStyles.titleSmall()),
                  //Text('January 25, 2024', style: TextStyles.titleSmall()),
                  Text(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
