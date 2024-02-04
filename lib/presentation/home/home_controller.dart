import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/managers/hive_manager.dart';
import 'package:gitclic/data/models/commits_model.dart';
import 'package:gitclic/data/services/auth_services.dart';
import 'package:gitclic/data/services/github_services.dart';
import 'package:gitclic/main.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/models/repos_model.dart';
import '../../data/models/weekly_commits_data_model.dart';

class HomeController extends GetxController {
  //Variable for use auth services
  AuthServices authServices = AuthServices();
  GitHubServices gitHubServices = GitHubServices();

  //Loading variables
  final RxBool loadingSignOut = false.obs;
  final RxBool loadingWeeklyCommitCounter = false.obs;
  final RxBool loadingRepos = false.obs;
  final RxBool loadingCommits = false.obs;

  //List variables
  final RxList<WeeklyCommitData> weeklyList = <WeeklyCommitData>[].obs;
  //List repos data
  final repositoriesList = <ReposModel>[].obs;
  //List commits data
  final commitsList = <CommitsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getWeeklyCommitCounter();
    getRepositories();
    getCommits();
  }

  //This is a function for sign out user session
  Future<void> signOut() async {
    try {
      //Start loading sign out
      loadingSignOut.value = true;

      //Is necessary to save close user session in supabase
      //See docs https://supabase.com/docs/reference/dart/upgrade-guide
      final response = await authServices.signOut();
      await supabase.auth.signOut();

      //Condition when session is closed successfully
      if (response.statusCode == 204) {
        //Show successfully snackbar
        Get.snackbar('OK', 'Session closed successfully',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);

        //Finish loading sign out
        loadingSignOut.value = false;
        //Update slideMenu to change loading icon in sign out option
        update(['slideMenu']);

        //Is necessary close session in local hivemanager too
        hiveManager.signOut();

        //Close all pages and redirect the user to onboarding page
        Get.offAllNamed(Approutes.onboardingPage);
      }
    } on AuthException catch (error) {
      //This exception is for catch supabase.auth methods
      //Show snackbar error
      Get.snackbar('Error', error.message,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      //Finish loading sign out
      loadingSignOut.value = false;
      //Update slideMenu to change loading icon in sign out option
      update(['slideMenu']);

      //Is necessary close session in local hivemanager too
      hiveManager.signOut();
    } catch (e) {
      //Show snackbar error
      Get.snackbar('Error', '$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      //Finish loading sign out
      loadingSignOut.value = false;

      //Update slideMenu to change loading icon in sign out option
      update(['slideMenu']);

      //Is necessary close session in local hivemanager too
      hiveManager.signOut();
    }
  }

  //This is a functions to handle and convert weeklyCounterResponse data
  void updateWeeklyList(List<List<int>> commitDataList) {
    // Filter and map data
    List<WeeklyCommitData> newDataList = commitDataList
        .where((commitData) => commitData[2] != 0)
        .map((commitData) {
      int day = commitData[0];
      int hour = commitData[1];
      int commitCount = commitData[2];

      String dayOfWeek;
      switch (day) {
        case 0:
          dayOfWeek = 'Sunday';
          break;
        case 1:
          dayOfWeek = 'Monday';
          break;
        case 2:
          dayOfWeek = 'Tuesday';
          break;
        case 3:
          dayOfWeek = 'Wednesday';
          break;
        case 4:
          dayOfWeek = 'Thursday';
          break;
        case 5:
          dayOfWeek = 'Friday';
          break;
        case 6:
          dayOfWeek = 'Saturday';
          break;
        default:
          dayOfWeek = 'Unknown';
      }

      return WeeklyCommitData(
        weekDay: dayOfWeek, // Actualiza a dayOfWeek
        weekHour: hour.toString(), //hour.toString(),
        weekCommitCounter: commitCount,
      );
    }).toList();

    // Update obx list with data filtered
    weeklyList.assignAll(newDataList);
  }

  //This is a function to get weekly commits
  Future<void> getWeeklyCommitCounter() async {
    loadingWeeklyCommitCounter.value = true;
    try {
      //Get http response
      final weeklyCounterResponse = await gitHubServices.weeklyCommitCounter(
          repoName: 'gitclic', userName: 'kevinlopezs');

      //check searchresponse status
      if (weeklyCounterResponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', weeklyCounterResponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingWeeklyCommitCounter.value = false;
        update(['homePage']);
        return;
      }

      updateWeeklyList((weeklyCounterResponse.data as List)
          .map((dynamic item) => (item as List).cast<int>())
          .toList());

      loadingWeeklyCommitCounter.value = false;
      update(['homePage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingWeeklyCommitCounter.value = false;
      update(['homePage']);
    }
  }

  //This is a function to get repos by user
  Future<void> getRepositories() async {
    loadingRepos.value = true;
    try {
      //Get http response
      final repositoriesResponse =
          await gitHubServices.reposByUser(userName: 'kevinlopezs');

      //check searchresponse status
      if (repositoriesResponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', repositoriesResponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingRepos.value = false;
        update(['homePage']);
        return;
      }

      //Get repos data and convert parse json data
      final List<dynamic> reposDataList =
          repositoriesResponse.data as List<dynamic>;

      final List<ReposModel> reposList = reposDataList
          .map((repoData) =>
              ReposModel.fromJson(repoData as Map<String, dynamic>))
          .toList();

      //Add commits to list
      repositoriesList.assignAll(reposList);

      loadingRepos.value = false;
      update(['homePage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingRepos.value = false;
      update(['homePage']);
    }
  }

  //This is a function to get commits
  Future<void> getCommits() async {
    loadingCommits.value = true;
    try {
      //Get http response
      final commitsReponse = await gitHubServices.commitsByUserAndRepo(
          userName: 'kevinlopezs', repoName: 'gitclic');

      //check searchresponse status
      if (commitsReponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', commitsReponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingCommits.value = false;
        update(['homePage']);
        return;
      }

      //Get repos data and convert parse json data
      final List<dynamic> commitsDataList =
          commitsReponse.data as List<dynamic>;

      final List<CommitsModel> commitList = commitsDataList
          .map((commitData) =>
              CommitsModel.fromJson(commitData as Map<String, dynamic>))
          .toList();

      //Add commits to list
      commitsList.assignAll(commitList);

      loadingCommits.value = false;
      update(['homePage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingCommits.value = false;
      update(['homePage']);
    }
  }
}
