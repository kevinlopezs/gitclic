// To parse this JSON data, do
//
//     final commitCommentModel = commitCommentModelFromJson(jsonString);

import 'dart:convert';

List<CommitCommentModel> commitCommentModelFromJson(String str) =>
    List<CommitCommentModel>.from(
        json.decode(str).map((x) => CommitCommentModel.fromJson(x)));

String commitCommentModelToJson(List<CommitCommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommitCommentModel {
  String url;
  String htmlUrl;
  int id;
  String nodeId;
  User user;
  dynamic position;
  dynamic line;
  dynamic path;
  String commitId;
  DateTime createdAt;
  DateTime updatedAt;
  String authorAssociation;
  String body;
  Reactions reactions;

  CommitCommentModel({
    required this.url,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.user,
    required this.position,
    required this.line,
    required this.path,
    required this.commitId,
    required this.createdAt,
    required this.updatedAt,
    required this.authorAssociation,
    required this.body,
    required this.reactions,
  });

  factory CommitCommentModel.fromJson(Map<String, dynamic> json) =>
      CommitCommentModel(
        url: json["url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        nodeId: json["node_id"],
        user: User.fromJson(json["user"]),
        position: json["position"],
        line: json["line"],
        path: json["path"],
        commitId: json["commit_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        authorAssociation: json["author_association"],
        body: json["body"],
        reactions: Reactions.fromJson(json["reactions"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "html_url": htmlUrl,
        "id": id,
        "node_id": nodeId,
        "user": user.toJson(),
        "position": position,
        "line": line,
        "path": path,
        "commit_id": commitId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "author_association": authorAssociation,
        "body": body,
        "reactions": reactions.toJson(),
      };
}

class Reactions {
  String url;
  int totalCount;
  int the1;
  int reactions1;
  int laugh;
  int hooray;
  int confused;
  int heart;
  int rocket;
  int eyes;

  Reactions({
    required this.url,
    required this.totalCount,
    required this.the1,
    required this.reactions1,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        url: json["url"],
        totalCount: json["total_count"],
        the1: json["+1"],
        reactions1: json["-1"],
        laugh: json["laugh"],
        hooray: json["hooray"],
        confused: json["confused"],
        heart: json["heart"],
        rocket: json["rocket"],
        eyes: json["eyes"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "total_count": totalCount,
        "+1": the1,
        "-1": reactions1,
        "laugh": laugh,
        "hooray": hooray,
        "confused": confused,
        "heart": heart,
        "rocket": rocket,
        "eyes": eyes,
      };
}

class User {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}
