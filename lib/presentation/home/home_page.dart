import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/helpers/commit_type_util.dart';
import 'package:gitclic/presentation/global_widgets/custom_appbar.dart';
import 'package:gitclic/presentation/home/home_controller.dart';
import 'package:gitclic/presentation/home/home_widgets/custom_card_weekly_counter.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:gitclic/presentation/search/search_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

import 'home_widgets/custom_card_last_commit.dart';
import 'home_widgets/custom_card_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SearchPageController searchController = Get.find();
    final TextEditingController searchTextEditController =
        TextEditingController();

    return GetBuilder<HomeController>(
        id: 'homePage',
        builder: (homeController) {
          return Scaffold(
            appBar: CustomAppBar(
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //This is a card for search engine
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                          height: 100.h,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: const Text('Search commits..'),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Get.theme.primaryColor,
                                ),
                                border: InputBorder.none,
                              ),
                              onFieldSubmitted: (value) {
                                //Save text value on texteditingcontroller
                                searchTextEditController.text = value;

                                //Start search on github
                                searchController.searchCommit(
                                    searchText: searchTextEditController.text);

                                //Go to search page
                                Get.toNamed(Approutes.searchPage);
                              },
                              onChanged: (value) {
                                //Save text value on texteditingcontroller when this changes
                                searchTextEditController.text = value;
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ),
                        ),
                      ),

                      //Title for weekly commits
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Weekly commits',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are card scrolling for weekly commits
                      homeController.loadingWeeklyCommitCounter.value == true
                          ? const Center(child: CircularProgressIndicator())
                          : homeController.weeklyList.isEmpty
                              ? const Text(
                                  'Error loading Weekly commits counter..')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: homeController.weeklyList
                                        .map((element) {
                                      return CardWeeklyCommitCounter(
                                          weekDay: element.weekDay,
                                          weekHour: element.weekHour,
                                          weekCommitCounter:
                                              element.weekCommitCounter);
                                    }).toList(),
                                  ),
                                ),

                      //Title for repositories
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Repositories',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are card scrolling for respositories commits

                      homeController.loadingRepos.value == true
                          ? const Center(child: CircularProgressIndicator())
                          : homeController.repositoriesList.isEmpty
                              ? const Text('Error loading repositories..')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: homeController.repositoriesList
                                        .map((element) {
                                      return InkWell(
                                        onTap: () {},
                                        child: CustomCardRepo(
                                            size: size,
                                            repoName: element.name,
                                            repoDescription: element
                                                    .description ??
                                                'User not added a description yet'),
                                      );
                                    }).toList(),
                                  ),
                                ),

                      //Title for repositories
                      20.verticalSpace,
                      //Title for Latest commits
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 15.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Latest GitClic commits',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are card scrolling for latest gitclic commits
                      homeController.loadingCommits.value == true
                          ? const Center(child: CircularProgressIndicator())
                          : homeController.commitsList.isEmpty
                              ? const Text('Error loading repositories..')
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: homeController.commitsList
                                        .map((element) {
                                      //Conditions for commit type
                                      String commitType =
                                          CommitTypeUtil.determineCommitType(
                                              element.commit.message);

                                      return InkWell(
                                        onTap: () {},
                                        child: CustomCardLastCommit(
                                            size: size,
                                            commitDate:
                                                element.commit.committer.date,
                                            commiterName:
                                                element.commit.committer.name,
                                            commitType: commitType,
                                            repoName: 'gitclic',
                                            commitDescription:
                                                element.commit.message),
                                      );
                                    }).toList(),
                                  ),
                                ),
                    ],
                  ),
                ),
              )),
            ),
          );
        });
  }
}
