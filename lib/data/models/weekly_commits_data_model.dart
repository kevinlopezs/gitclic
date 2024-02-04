import 'dart:convert';

class WeeklyCommitData {
  final String weekDay;
  final String weekHour;
  final int weekCommitCounter;

  WeeklyCommitData({
    required this.weekDay,
    required this.weekHour,
    required this.weekCommitCounter,
  });

  // To parse this JSON data, do
//
//     final weeklyCommitData = weeklyCommitDataFromJson(jsonString);

  List<List<int>> weeklyCommitDataFromJson(String str) => List<List<int>>.from(
      json.decode(str).map((x) => List<int>.from(x.map((x) => x))));

  String weeklyCommitDataToJson(List<List<int>> data) => json.encode(
      List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));
}
