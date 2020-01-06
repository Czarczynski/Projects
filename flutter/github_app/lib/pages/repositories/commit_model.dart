import '../../api/github_http_client.dart';
import 'package:flutter/material.dart';

class FetchCommits {
  FetchCommits(
    this.author,
    this.message,
  );

  final String author, message;

  factory FetchCommits.fromJson(Map<String, dynamic> json) =>
      FetchCommits(json['committer']['login'], json['commit']['message']);
}

class BlocCommits extends ChangeNotifier {
  List<FetchCommits> items=[];

  BlocCommits(String url) {
    fetchCommit(url).then((lista) {
      if (lista.isNotEmpty)
        this.items = lista;
      notifyListeners();
    });

  }

  Future<List<FetchCommits>> fetchCommit(String url) async {
    final response = await GithubHttpClient().get(url);

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((item) => FetchCommits.fromJson(item))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
