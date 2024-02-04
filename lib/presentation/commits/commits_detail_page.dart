import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/helpers/commit_type_util.dart';
import 'package:gitclic/presentation/commits/commits_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

import 'commits_widgets.dart/custom_comments.dart';
import 'commits_widgets.dart/custom_commit_card_detail.dart';
import 'commits_widgets.dart/custom_commit_card_stats.dart';

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
                      CustomCommitCardDetail(
                          size: size,
                          name: commitController
                              .currentCommit.value.commit.author.name,
                          commitType: //Conditions for commit type
                              CommitTypeUtil.determineCommitType(
                                  commitController
                                      .currentCommit.value.commit.message),
                          date: commitController
                              .currentCommit.value.commit.author.date,
                          email: commitController
                              .currentCommit.value.commit.author.email),

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
                      CustomCommitCardDetail(
                          size: size,
                          name: commitController
                              .currentCommit.value.commit.committer.name,
                          commitType: //Conditions for commit type
                              CommitTypeUtil.determineCommitType(
                                  commitController
                                      .currentCommit.value.commit.message),
                          date: commitController
                              .currentCommit.value.commit.committer.date,
                          email: commitController
                              .currentCommit.value.commit.committer.email),

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
                            commitController.currentCommit.value.commit.message,
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

                      //These are cards scrolling for commit stats
                      commitController.loadingCommit.value == true
                          ? const Center(child: CircularProgressIndicator())
                          : CustomCommitStatsCard(
                              total: commitController.commitTotalStats.value,
                              additions: commitController.commitAdditions.value,
                              deletions:
                                  commitController.commitTDeletions.value,
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
                                    'Total comments: ${commitController.currentCommit.value.commit.commentCount}',
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

                      //These are comments
                      commitController.loadingCommitComment.value == true
                          ? const Center(child: CircularProgressIndicator())
                          : commitController.commitCommentsList.isEmpty
                              ? Center(
                                  child: Text('No comments..',
                                      style: TextStyles.titleSmall()))
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: commitController
                                        .commitCommentsList
                                        .map((element) {
                                      return SizedBox(
                                        height: size.height * 0.1,
                                        width: size.width,
                                        child: CustomCommentWidget(
                                            avatarUrl: element.user.avatarUrl,
                                            date: element.createdAt,
                                            description: element.body),
                                      );
                                    }).toList(),
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
