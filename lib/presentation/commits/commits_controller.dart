import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/models/commits_comment_model.dart';
import 'package:gitclic/data/models/commits_model.dart';
import 'package:gitclic/data/services/github_services.dart';

class CommitController extends GetxController {
  //Instance GitHub services
  GitHubServices commitService = GitHubServices();
  //Obx variable for currentRepo or current repo selected by user
  final Rx<CommitsModel> currentCommit = Rx(Get.arguments);

  //Obs stats variables
  final RxInt commitTotalStats = 0.obs;
  final RxInt commitAdditions = 0.obs;
  final RxInt commitTDeletions = 0.obs;

  //Loading obx variable
  final RxBool loadingCommit = false.obs;
  final RxBool loadingCommitComment = false.obs;

  //Comments List
  final commitCommentsList = <CommitCommentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCommit(commitSha: currentCommit.value.sha);
    getCommitComment(commitSha: currentCommit.value.sha);
  }

  //This function is really to get commit stats by another request
  Future<void> getCommit({required String commitSha}) async {
    loadingCommit.value = true;
    try {
      //Get http response
      final commitResponse = await commitService.commit(
          repoName: 'gitclic',
          commitSha: commitSha,
          userName: currentCommit.value.author.login);

      //check searchresponse status
      if (commitResponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', commitResponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingCommit.value = false;
        update(['commitDetailPage']);
        return;
      }

      //Get commit model data and convert parse json data
      final CommitsModel commitResponseData =
          CommitsModel.fromJson(commitResponse.data);

      //Update stats
      commitTotalStats.value = commitResponseData.stats?.total ?? 0;
      commitAdditions.value = commitResponseData.stats?.additions ?? 0;
      commitTDeletions.value = commitResponseData.stats?.deletions ?? 0;

      loadingCommit.value = false;
      update(['commitDetailPage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingCommit.value = false;
      update(['commitDetailPage']);
    }
  }

  Future<void> getCommitComment({required String commitSha}) async {
    loadingCommitComment.value = true;
    try {
      //Get http response
      final commitResponse = await commitService.commitComments(
          repoName: 'gitclic',
          commitSha: commitSha,
          userName: currentCommit.value.author.login);

      //check searchresponse status
      if (commitResponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', commitResponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingCommitComment.value = false;
        update(['commitDetailPage']);
        return;
      }

      //Get searchData and convert parse json data

      //Get repos data and convert parse json data
      final List<dynamic> commitCommentsDataList =
          commitResponse.data as List<dynamic>;

      final List<CommitCommentModel> commitList = commitCommentsDataList
          .map((commitData) =>
              CommitCommentModel.fromJson(commitData as Map<String, dynamic>))
          .toList();

      //Add commits to list
      commitCommentsList.assignAll(commitList);
      loadingCommitComment.value = false;
      update(['commitDetailPage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingCommitComment.value = false;
      update(['commitDetailPage']);
    }
  }
}
