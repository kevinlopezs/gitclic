import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/repos/repos_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class RepoListPage extends StatelessWidget {
  const RepoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<ReposController>(
        id: 'repoListCommitsPage',
        builder: (reposController) {
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
                          //Title for weekly commits
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Repository commits list',
                              style: TextStyles.subtitleMedium(),
                            ),
                          ),
                        ],
                      ),

                      //Title for weekly commits

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Repository:',
                              style: TextStyles.subtitleMedium(),
                            ),
                          ),
                          Card(
                            color: Get.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                reposController.currentRepo.value.name,
                                style:
                                    TextStyles.titleSmall(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )

                      //These are cards for commits search results
                      //CustomCardCommit(size: size),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}