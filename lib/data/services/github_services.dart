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
}
