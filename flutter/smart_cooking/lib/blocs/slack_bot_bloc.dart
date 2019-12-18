import 'dart:async';

import 'package:smart_cooking/app_config.dart';
import 'package:http/http.dart' as http;

class SlackBotMessageBloc {
  bool confirmation = false;

  Future sendMsg(String text) async {
    try {
      // ignore: unused_local_variable
      final response = await http.post('${SlackBotConfig.POST_MSG_URL}',
          body: {"channel": '${SlackBotConfig.CHANNEL}', 'text': text},
          headers: {"Authorization": "${SlackBotConfig.AUTHORIZATION}"});
      confirmation = true;
    } catch (error) {
      throw error;
    }
  }
}
