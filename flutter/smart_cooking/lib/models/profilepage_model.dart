import 'package:smart_cooking/app_config.dart';

class ProfilePageModel {
  String name, userId, image;

  ProfilePageModel({
    this.name = AppConfig.DEFAULT_NAME,
    this.userId = AppConfig.DEFAULT_USER_ID,
    this.image = AppConfig.DEFAULT_IMAGE,
  });

  factory ProfilePageModel.fromJson(Map<String, dynamic> json) {
    return ProfilePageModel(
        name: json['name'],
        userId: json['user_id'],
        image: json['picture_url']);
  }

  @override
  bool operator ==(covariant ProfilePageModel other) =>
      other.name == name && other.userId == userId && other.image == image;

  int get hashCode => name.hashCode ^ userId.hashCode ^ image.hashCode;
}
