import '../../api/github_http_client.dart';
import 'package:flutter/material.dart';
import 'repositories_content.dart';
import 'repo_model.dart';
class FetchContent {
  FetchContent(this.name, this.download, this.type, this.content, this.path);

  final String name, download, type, content, path;

  factory FetchContent.fromJson(Map<String, dynamic> json) {
    return FetchContent(
      json['name'], json['html_url'], json['type'], json['content'], json['path']);
  }
}



class BlocContent extends ChangeNotifier{
  List<FetchContent> items=[];
  BlocContent(String url){
    fetchContent(url).then((lista){
      if(lista.isNotEmpty)
        this.items = lista;

      notifyListeners();
    });
  }

  Future<List<FetchContent>> fetchContent(String url) async {
    final response = await GithubHttpClient().get(url);

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((item) => FetchContent.fromJson(item))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  FetchContent file;
  readFile(String url){
    fetchFileContent(url).then((lista){
      this.file = lista;
      notifyListeners();
    });
  }

  insideTree(BuildContext context, FetchContent item, Repo element){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RepositoriesContent(item, element)));
  }

  Future<FetchContent> fetchFileContent(String url) async {
    final response = await GithubHttpClient().get(url);

    if (response.statusCode == 200) {
      return FetchContent.fromJson(response.data);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

//  subPage(BuildContext context, FetchContent item, Repo element){
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) =>
//                RepositoriesContent(item, element)));
//    notifyListeners();
//  }

}
