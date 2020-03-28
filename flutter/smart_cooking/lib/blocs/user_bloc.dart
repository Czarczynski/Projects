import 'dart:async';

import 'package:smart_cooking/api/network_api_client.dart';
import 'package:smart_cooking/models/availableresources_model.dart';
import 'package:smart_cooking/models/user_model.dart';

class UserBloc {
  UserBloc();

  static final UserBloc profilePageBloc = UserBloc();

  factory UserBloc.internal() => UserBloc.profilePageBloc;

  // ignore: close_sinks
  StreamController _streamControllerProfileInfo =
      StreamController<UserModel>.broadcast();

  Stream get streamControllerProfileInfo => _streamControllerProfileInfo.stream;

  UserModel profileInfo;

  Future<UserModel> fetchUserInfo() async {
    var userId = await _getId();

    final response = await SmartCookingHttpClient().get('/api/User/' + userId);
    _isInProgress = false;
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else
      throw Exception('Fetching Profile data Error');
  }

  bool _isInProgress = true;

  bool get isInProgress => _isInProgress;

  void fetchData() async {
    if (this.profileInfo != null)
      _streamControllerProfileInfo.sink.add(this.profileInfo);

    UserModel _responseProfileInfo = await fetchUserInfo();
    if (profileInfo == null || profileInfo != _responseProfileInfo) {
      profileInfo = _responseProfileInfo;
    }
    _streamControllerProfileInfo.sink.add(this.profileInfo);
  }

  Future<String> _getId() async {
    var response = await SmartCookingHttpClient().get("/GetUserId");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw new Exception("Internet problem");
    }
  }
}
