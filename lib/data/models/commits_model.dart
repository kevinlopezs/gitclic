// To parse this JSON data, do
//
//     final commitsModel = commitsModelFromJson(jsonString);

import 'dart:convert';

List<CommitsModel> commitsModelFromJson(String str) => List<CommitsModel>.from(
    json.decode(str).map((x) => CommitsModel.fromJson(x)));

String commitsModelToJson(List<CommitsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommitsModel {
  String sha;
  String nodeId;
  Commit commit;
  String url;
  String htmlUrl;
  String commentsUrl;
  CommitsModelAuthor author;
  CommitsModelAuthor committer;
  List<Parent> parents;

  CommitsModel({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  factory CommitsModel.fromJson(Map<String, dynamic> json) => CommitsModel(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: Commit.fromJson(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: CommitsModelAuthor.fromJson(json["author"]),
        committer: CommitsModelAuthor.fromJson(json["committer"]),
        parents:
            List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit.toJson(),
        "url": url,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "author": author.toJson(),
        "committer": committer.toJson(),
        "parents": List<dynamic>.from(parents.map((x) => x.toJson())),
      };
}

class CommitsModelAuthor {
  Login login;
  int id;
  NodeId nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  FollowingUrl followingUrl;
  GistsUrl gistsUrl;
  StarredUrl starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  EventsUrl eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  CommitsModelAuthor({
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

  factory CommitsModelAuthor.fromJson(Map<String, dynamic> json) =>
      CommitsModelAuthor(
        login: loginValues.map[json["login"]]!,
        id: json["id"],
        nodeId: nodeIdValues.map[json["node_id"]]!,
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: followingUrlValues.map[json["following_url"]]!,
        gistsUrl: gistsUrlValues.map[json["gists_url"]]!,
        starredUrl: starredUrlValues.map[json["starred_url"]]!,
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: eventsUrlValues.map[json["events_url"]]!,
        receivedEventsUrl: json["received_events_url"],
        type: typeValues.map[json["type"]]!,
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": loginValues.reverse[login],
        "id": id,
        "node_id": nodeIdValues.reverse[nodeId],
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrlValues.reverse[followingUrl],
        "gists_url": gistsUrlValues.reverse[gistsUrl],
        "starred_url": starredUrlValues.reverse[starredUrl],
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrlValues.reverse[eventsUrl],
        "received_events_url": receivedEventsUrl,
        "type": typeValues.reverse[type],
        "site_admin": siteAdmin,
      };
}

enum EventsUrl { HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_EVENTS_PRIVACY }

final eventsUrlValues = EnumValues({
  "https://api.github.com/users/kevinlopezs/events{/privacy}":
      EventsUrl.HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_EVENTS_PRIVACY
});

enum FollowingUrl {
  HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_FOLLOWING_OTHER_USER
}

final followingUrlValues = EnumValues({
  "https://api.github.com/users/kevinlopezs/following{/other_user}":
      FollowingUrl.HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_FOLLOWING_OTHER_USER
});

enum GistsUrl { HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_GISTS_GIST_ID }

final gistsUrlValues = EnumValues({
  "https://api.github.com/users/kevinlopezs/gists{/gist_id}":
      GistsUrl.HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_GISTS_GIST_ID
});

enum Login { KEVINLOPEZS }

final loginValues = EnumValues({"kevinlopezs": Login.KEVINLOPEZS});

enum NodeId { U_KG_DO_BC_Y_OW }

final nodeIdValues = EnumValues({"U_kgDOBc-YOw": NodeId.U_KG_DO_BC_Y_OW});

enum StarredUrl { HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_STARRED_OWNER_REPO }

final starredUrlValues = EnumValues({
  "https://api.github.com/users/kevinlopezs/starred{/owner}{/repo}":
      StarredUrl.HTTPS_API_GITHUB_COM_USERS_KEVINLOPEZS_STARRED_OWNER_REPO
});

enum Type { USER }

final typeValues = EnumValues({"User": Type.USER});

class Commit {
  CommitAuthor author;
  CommitAuthor committer;
  String message;
  Tree tree;
  String url;
  int commentCount;
  Verification verification;

  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "committer": committer.toJson(),
        "message": message,
        "tree": tree.toJson(),
        "url": url,
        "comment_count": commentCount,
        "verification": verification.toJson(),
      };
}

class CommitAuthor {
  String name;
  String email;
  DateTime date;

  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"]!,
        email: json["email"]!,
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
      };
}

class Tree {
  String sha;
  String url;

  Tree({
    required this.sha,
    required this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}

class Verification {
  bool verified;
  Reason reason;
  dynamic signature;
  dynamic payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: reasonValues.map[json["reason"]]!,
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reasonValues.reverse[reason],
        "signature": signature,
        "payload": payload,
      };
}

enum Reason { UNSIGNED }

final reasonValues = EnumValues({"unsigned": Reason.UNSIGNED});

class Parent {
  String sha;
  String url;
  String htmlUrl;

  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json["sha"],
        url: json["url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
        "html_url": htmlUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
