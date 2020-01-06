import 'package:flutter/material.dart';
import 'repo_model.dart';
import '../../api/github_http_client.dart';
import 'package:dio/dio.dart';

class FetchIssues {
  FetchIssues(this.title, this.body, this.number, this.state);

  final String title, body, state;
  int number;

  factory FetchIssues.fromJson(Map<String, dynamic> json) =>
      FetchIssues(json['title'], json['body'], json['number'], json['state']);
}

class PostIssues {
  PostIssues(
    this.title,
    this.body,
  );

  final String title, body;

  factory PostIssues.fromJson(Map<String, dynamic> json) =>
      PostIssues(json['title'], json['body']);

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = title;
    map["body"] = body;

    return map;
  }
}

class BlocIssues extends ChangeNotifier {
  List<FetchIssues> items=[];

  BlocIssues(String url) {
    fetchIssues(url).then((lista) {
      if(lista.isNotEmpty)
        this.items = lista;
      else
        return CircularProgressIndicator();
      notifyListeners();
    });
  }

  Future<PostIssues> createIssue(String url, {Map body}) async {
    return GithubHttpClient().post(url, body: body).then((Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while posting data");
      }
      return PostIssues.fromJson(response.data);
    });
  }

  send(
      TextEditingController controllerTitle,
      TextEditingController controllerComment,
      GlobalKey<FormState> _formKey,
      Repo element) async {
    if (_formKey.currentState.validate()) {
      var title = controllerTitle.text;
      var comment = controllerComment.text;
      PostIssues newPost = PostIssues(title, comment ?? "No comment");
      PostIssues p = await createIssue('repos/${element.path}/issues',
          body: newPost.toMap());
      notifyListeners();
    }
  }

  Future<List<FetchIssues>> fetchIssues(String url) async {
    final response = await GithubHttpClient().get('$url?state=all');

    if (response.statusCode == 200) {
      List<FetchIssues> list = (response.data as List)
          .map((item) => FetchIssues.fromJson(item))
          .toList();
      list.sort((issue1, issue2) => issue1.number.compareTo(issue2.number));

      return list;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
