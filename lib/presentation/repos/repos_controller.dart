import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/commits_model.dart';
import '../../data/models/repos_model.dart';
import '../../data/services/github_services.dart';

class ReposController extends GetxController {
  //Instance GitHub services
  GitHubServices searchService = GitHubServices();

  //Obx variable for currentRepo or current repo selected by user
  final Rx<ReposModel> currentRepo = Rx(Get.arguments);

  //Loading
  final RxBool loadingRepoCommits = false.obs;

  //List search data
  final repoCommitsList = <CommitsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCommitsByRepo(repoName: currentRepo.value.name);
  }

  Future<void> getCommitsByRepo({required String repoName}) async {
    loadingRepoCommits.value = true;
    try {
      //Get http response
      final commitsRepoResponse = await searchService.commitsByUserAndRepo(
          repoName: repoName, userName: 'kevinlopezs');

      //check searchresponse status
      if (commitsRepoResponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', commitsRepoResponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingRepoCommits.value = false;
        update(['repoListCommitsPage']);
        return;
      }

      //Get repos data and convert parse json data
      final List<dynamic> commitsRepoDataList =
          commitsRepoResponse.data as List<dynamic>;

      final List<CommitsModel> commitList = commitsRepoDataList
          .map((commitData) =>
              CommitsModel.fromJson(commitData as Map<String, dynamic>))
          .toList();

      //Add commits to list
      repoCommitsList.assignAll(commitList);
      loadingRepoCommits.value = false;
      update(['repoListCommitsPage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingRepoCommits.value = false;
      update(['repoListCommitsPage']);
    }
  }
}
