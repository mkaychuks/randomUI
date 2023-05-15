// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  String activity;
  double accessibility;
  String type;
  int participants;
  double price;
  String link;
  String key;

  Activity({
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activity: json["activity"],
        accessibility: json["accessibility"]?.toDouble(),
        type: json["type"],
        participants: json["participants"],
        price: json["price"]?.toDouble(),
        link: json["link"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "accessibility": accessibility,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
      };
}



Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    int userId;
    int id;
    String title;
    String body;

    Post({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
