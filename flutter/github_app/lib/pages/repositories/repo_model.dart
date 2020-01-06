import '../../api/github_http_client.dart';
class Repo {
  Repo(
      this.path,
      this.description,
      this.star,
      this.login,
      this.node_id,
      this.avatar_url,
      this.html_url,
      this.id,
      this.watchers,
      this.size,
      this.default_branch,
      this.open_issues_count,
      this.private,
      this.url,
      this.name,
      this.like);

  final String name,login, node_id, avatar_url, url, html_url, path, description,default_branch;
  final bool private;
  bool like;

  changeLike(){
    like = !like;
  }
  int id, star, watchers, size, open_issues_count;

  factory Repo.fromJson(Map<String, dynamic> json) => Repo(
      json['full_name'],
      json['description'],
      json['stargazers_count'],
      json['owner']['login'],
      json['owner']['node_id'],
      json['owner']['avatar_url'],
      json['owner']['html_url'],
      json['owner']['id'],
      json['watchers_count'],
      json['size'],
      json['default_branch'],
      json['open_issues_count'],
      json['private'],
      json['owner']['url'],
      json['name'],
      false);
}
