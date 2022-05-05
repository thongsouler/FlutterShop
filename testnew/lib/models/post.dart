import 'package:flutter/material.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  //
  static List<Post> listFromJson(List<dynamic> list) =>
      List<Post>.from(list.map((e) => Post.fromJson(e)));
}
