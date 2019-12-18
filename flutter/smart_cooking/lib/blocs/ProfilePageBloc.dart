import 'dart:async';

import 'package:smart_cooking/api/network_api_client.dart';
import 'package:smart_cooking/models/availableresources_model.dart';
import 'package:smart_cooking/models/profilepage_model.dart';

class ProfilePageBloc {
  ProfilePageBloc();

  static final ProfilePageBloc profilePageBloc = ProfilePageBloc();

  factory ProfilePageBloc.internal() => ProfilePageBloc.profilePageBloc;

  // ignore: close_sinks
  StreamController _streamControllerProfileInfo =
      StreamController<ProfilePageModel>.broadcast();

  Stream get streamControllerProfileInfo => _streamControllerProfileInfo.stream;

  // ignore: close_sinks
  StreamController _streamControllerAvailableResources =
      StreamController<AvailableResourcesModel>.broadcast();

  Stream get streamControllerAvailableResources =>
      _streamControllerAvailableResources.stream;

  ProfilePageModel profileInfo;
  AvailableResourcesModel availableResources;

  Future<ProfilePageModel> fetchProfileInfo() async {
    final response = await AppuniteHttpClient().get('/api/v1/profile');
    _isInProgress = false;
    if (response.statusCode == 200) {
      return ProfilePageModel.fromJson(response.data);
    } else
      throw Exception('Fetching Profile data Error');
  }

  bool _isInProgress = true;

  bool get isInProgress => _isInProgress;

  Future<AvailableResourcesModel> fetchAvailableResources() async {
    final response =
        await AppuniteHttpClient().get('/api/v1/donations/available_resources');
    if (response.statusCode == 200) {
      return AvailableResourcesModel.fromJson(response.data);
    } else
      throw Exception('Fetching Available Resources data Error');
  }

  fetchData() async {
    if (this.profileInfo != null)
      _streamControllerProfileInfo.sink.add(this.profileInfo);
    if (this.availableResources != null)
      _streamControllerAvailableResources.sink.add(this.availableResources);

    ProfilePageModel _responseProfileInfo = await fetchProfileInfo();
    if (profileInfo == null || profileInfo != _responseProfileInfo) {
      profileInfo = _responseProfileInfo;
    }
    _streamControllerProfileInfo.sink.add(this.profileInfo);

    AvailableResourcesModel _responseAvailableResources =
        await fetchAvailableResources();
    if (availableResources == null ||
        availableResources != _responseAvailableResources) {
      availableResources = _responseAvailableResources;
      _streamControllerAvailableResources.sink.add(this.availableResources);
    }
  }
}
