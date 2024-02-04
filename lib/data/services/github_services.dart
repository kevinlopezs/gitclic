import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GitHubServices {
  //Env configuration
  final url = dotenv.env['API_URL']!;
  final apiKey = dotenv.env['API_KEY']!;
  final tempToken = dotenv.env['TEMP_TOKEN']!;
  final apiGithub = dotenv.env['API_GITHUB']!;

  //Service to search a commit from GitHub API REST
  Future<Response> searchCommit(
      {required String searchText,
      required String userName,
      required String repoName}) async {
    try {
      Response response = await Dio().get(
        "$apiGithub/search/commits?q=$searchText+repo:$userName/$repoName",
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $tempToken',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }

  //Service to get weekly commit counter
  Future<Response> weeklyCommitCounter(
      {required String userName, required String repoName}) async {
    try {
      Response response = await Dio().get(
        "$apiGithub/repos/$userName/$repoName/stats/punch_card",
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $tempToken',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }

  //Service to get repositories by user
  Future<Response> reposByUser({
    required String userName,
  }) async {
    try {
      Response response = await Dio().get(
        "$apiGithub/users/$userName/repos",
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $tempToken',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }

  //Service to search a commit from GitHub API REST
  Future<Response> commitsByUserAndRepo({
    required String userName,
    required String repoName,
  }) async {
    try {
      Response response = await Dio().get(
        "$apiGithub/repos/$userName/$repoName/commits",
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $tempToken',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }

  //Service to search a commit from GitHub API REST
  Future<Response> commit({
    required String userName,
    required String repoName,
    required String commitSha,
  }) async {
    try {
      Response response = await Dio().get(
        "$apiGithub/repos/$userName/$repoName/commits/$commitSha",
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $tempToken',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }

  //Service to search a commit from GitHub API REST
  Future<Response> commitComments({
    required String userName,
    required String repoName,
    required String commitSha,
  }) async {
    try {
      Response response = await Dio().get(
        "$apiGithub/repos/$userName/$repoName/commits/$commitSha/comments",
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer $tempToken',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      return response;
    } on DioException catch (e) {
      final String dioError = e.response?.data['error_description'] ?? '';
      throw Exception(dioError);
    } catch (e) {
      throw Exception('Unexpected error ocurred. Error creating new user:$e');
    }
  }
}
