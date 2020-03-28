import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:smart_cooking/api/network_api_client.dart';

class LastVisitedBloc extends ChangeNotifier{
  final String id;
  LastVisitedBloc(this.id){
    _postLastVisited();
    notifyListeners();
  }

  Future _postLastVisited() async{
    try {
      await SmartCookingHttpClient().post('/PostLastVisited?lastVisitedId='+this.id);
    } catch (error) {
      throw error;
    }
  }

}
