import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:smart_cooking/api/network_api_client.dart';

class StarredBloc extends ChangeNotifier{
  final String id;
  bool confirmation=false;
  StarredBloc(this.id){
    _postStarred().then((_code){
      if(_code==200)
        confirmation = true;
    });
    notifyListeners();
  }

  Future<int> _postStarred() async{
    try {
      var response = await SmartCookingHttpClient().post("/PostStarred?starredId=${this.id}", body: null);
      if(response.statusCode ==200)
        return response.statusCode;
      else throw Exception("Status Code: ${response.statusCode}");
    } catch (error) {
      throw error;
    }
  }

}
