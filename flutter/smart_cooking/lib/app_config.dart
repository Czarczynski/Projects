import 'package:flutter/material.dart';

class AppConfig {
  static const String HOST_URL = "https://wallet-staging-api.appunite.net";
  static const String CLIENT_SECRET = "ZxDlT-6kGos4_kvXJl_SfXcl";
  static const String CLIENT_ID =
      '219486636480-6phjioavhvvj0j70jms585nadh5rr0gi.apps.googleusercontent.com';
  static const String ROUTE_TO_LOGIN = '/login';
  static const String ROUTE_TO_DASHBOARD = '/projectspage';
  static const String USER_AGENT =
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0";
  static const String DEFAULT_NAME = '_';
  static const String DEFAULT_USER_ID = '_';
  static const String DEFAULT_IMAGE =
      'https://static2.clutch.co/s3fs-public/logos/letterhead_logo.jpg?NllCKKF7SKZ_1lG9LfKMWQcnh_FtG_Sa';
}

class SlackBotConfig {
  static const String POST_MSG_URL = "https://slack.com/api/chat.postMessage";
  static const String CHANNEL = "CLJF8G80G";
  static const String AUTHORIZATION =
      "Bearer xoxp-698518541520-698537704613-698059592692-673bd9b3c5e4477a1a7b4a089f709ea7";
}

class ThemeConfig {
  static const Color BLUE_GRANADE = Color.fromRGBO(42, 41, 78, 1);
  static const Color GRAY_DARK = Color.fromRGBO(42, 42, 42, 1);
  static const Color PURPLE_ = Color.fromRGBO(94, 53, 177, 1);
  static const Color BLUE_GRAY = Color.fromRGBO(36, 43, 52, 1);
  static const Color MINT_GREEN = Color.fromRGBO(29, 223, 182, 1);
  static const Color ST_TROPAZ = Color.fromRGBO(119, 143, 173, 1);
  static const Color BLUE_LIGHT_GRAY = Color.fromRGBO(117, 127, 140, 1);
  static const Color BLUE_CYAN = Color.fromRGBO(219, 227, 237, 1);
  static const Color WHITE_SMOKE = Color.fromRGBO(245, 245, 245, 1);
  static const Color RED_NEAR_VENETIAN = Color.fromRGBO(192, 12, 19, 1);
  static const Color SOLITUDE = Color.fromRGBO(225, 238, 255, 1);
  static const Color SNOW = Color.fromRGBO(250, 250, 250, 1);
  static const Color VENETIAN_RED = Color.fromRGBO(176, 0, 17, 1);
}

class EngStrings {
  static const String COLLECTED = 'Collected';
  static const String PLN = 'PLN';

  static const String PROJECTS = 'Przepisy';
  static const String WALLET = 'Przepisy';
  static const String GUIDEBOOK = 'Urządzenia';
  static const String GUIDEBOOK2 = 'Moje urządzenia';
  static const String GOOGLE_SIGN_IN = 'Zaloguj się przez Google';
  static const String HISTORY = 'History';
  static const String PROJECT_COMPLETED = 'Project completed';
  static const String NO_INTERNET =
      'Something went wrong, please check your internet connection';
  static const String SETTINGS = 'Ustawienia';
  static const String PROFILE = 'Profil';
  static const String BUDGET = 'Budżet';
  static const String OK = 'OK';
  static const String ALREADY_GIVEN = 'Already voted for this project!';
  static const String GIVEN = 'You gave a vote!';
  static const String OUT_OF_BRICKS = 'You run out of bricks this mounth!';
  static const String AUTHOR = 'About Author';
  static const String DESCRIPTION = 'Opis';
  static const String VOTE = 'VOTE';
  static const String QUESTION_SURE = 'Czy na pewno wyjść';
  static const String YES = 'Tak';
  static const String NO = 'Nie';
  static const String ROOMS = 'Historia';
  static const String SEARCH = 'Szukaj';
  static const String DASHBOARD = 'Tablica';
  static const String UNDO = 'UNDO';
  static const String PLACE_IN_OFFICE = 'ZOBACZ DZISIEJSZE PRZEPISY';
  static const String KITCHEN_SNACKBAR = 'Woda zagotuje się za 3 minuty i 3 sekundy';
  static const String SLIMAK_SNACKBAR = 'Espresso gotowe za 2 minuty i 35 sekund';
  static const String MY_WALLETS = 'Moje ulubione przepisy';
  static const String KITCHEN_ACTIONS = 'Akcje kuchenne';
  static const String QR = 'QR';
  static const String ANNULLED_SUCCESSFULLY = 'Annulled successfully';
  static const String EMPTY = 'Nothing to show';
  static const String WORKPLACE = 'Your workplace is set';
}
