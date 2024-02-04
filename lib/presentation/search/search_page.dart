import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/helpers/commit_type_util.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:gitclic/presentation/search/search_controller.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

import '../global_widgets/custom_card_commit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SearchPageController searchController = Get.find();
    final TextEditingController searchTextEditController =
        TextEditingController();

    return GetBuilder<SearchPageController>(
        id: 'searchPage',
        builder: (searchPageController) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Icon go back
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
                          'Search results..',
                          style: TextStyles.subtitleMedium(),
                        ),
                      ),

                      //These are cards for commits search results
                      searchPageController.loadingSearch.value
                          ? const CircularProgressIndicator()
                          : searchPageController.searchCommitsList.isEmpty
                              ? const Text('Not found results..')
                              : Column(
                                  children: searchPageController
                                      .searchCommitsList
                                      .map((element) {
                                    //Conditions for commit type
                                    String commitType =
                                        CommitTypeUtil.determineCommitType(
                                            element.commit.message);

                                    return InkWell(
                                      onTap: () {
                                        print('jejej');
                                        Get.toNamed(Approutes.commitDetailPage,
                                            arguments: element);
                                      },
                                      child: CustomCardCommit(
                                        size: size,
                                        repoName:
                                            element.repository?[0].name ?? '',
                                        authorName: element.commit.author.name,
                                        commitDate:
                                            element.commit.committer.date,
                                        commitDescription:
                                            element.commit.message,
                                        commitType: commitType,
                                      ),
                                    );
                                  }).toList(),
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
