import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitclic/data/models/search_commit_model.dart';
import 'package:gitclic/data/services/github_services.dart';

class SearchPageController extends GetxController {
  //Instance GitHub services
  GitHubServices searchService = GitHubServices();

  //Search variables
  //final RxString searchText = ''.obs;

  //Getx arguments
  //String searchCommitValue = Get.arguments ?? '';

  //Loading Variables
  final RxBool loadingSearch = false.obs;

  //List search data
  final searchCommitsList = <Item>[].obs;

  //Function to get search with GitHub API REST
  Future<void> searchCommit({required String searchText}) async {
    loadingSearch.value = true;
    try {
      //Condition to return if search is empty
      if (searchText.isEmpty) {
        loadingSearch.value = false;
        update(['searchPage']);
        return;
      }

      //Get http response
      final searchResponse = await searchService.searchCommit(
          repoName: 'gitclic', searchText: searchText, userName: 'kevinlopezs');

      //check searchresponse status
      if (searchResponse.statusCode != 200) {
        //If searchresponse status does not success
        //Show a snackbar error and return
        Get.snackbar('Error', searchResponse.statusMessage ?? '',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        loadingSearch.value = false;
        update(['searchPage']);
        return;
      }

      //Get searchData and convert parse json data
      final searchModel = SearchModel.fromJson(searchResponse.data);
      //
      /*final List<SearchModel> searchTextList = searchResponse.data.map((item) {
        return SearchModel.fromJson(item);
      }).toList();*/

      //Add commits to list
      searchCommitsList.assignAll(searchModel.items);
      loadingSearch.value = false;
      update(['searchPage']);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error ocurred:$e',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingSearch.value = false;
      update(['searchPage']);
    }
  }
}
