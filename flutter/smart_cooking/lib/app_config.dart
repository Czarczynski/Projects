import 'package:flutter/material.dart';
import 'package:smart_cooking/theme.dart';
import 'package:smart_cooking/sensitive.dart';

class Config {
  static const String HOST_URL = "https://pleasurecookings.azurewebsites.net";
  static const String API_URL = "https://api.spoonacular.com";
  static const String ROUTE_TO_LOGIN = '/login';
  static const String ROUTE_TO_DASHBOARD = '/projectspage';
  static const String USER_AGENT =
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0";
  static const String DEFAULT_NAME = '_';
  static const String DEFAULT_USER_ID = '_';
  static const String DEFAULT_IMAGE =
      'https://static2.clutch.co/s3fs-public/logos/letterhead_logo.jpg?NllCKKF7SKZ_1lG9LfKMWQcnh_FtG_Sa';
  static const String DEFAULT_FOOD_IMAGE = 'https://toppng.com/uploads/preview/clipart-free-seaweed-clipart-draw-food-placeholder-11562968708qhzooxrjly.png';
}

class LightThemeConfig {
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
  static const Color WHITE = Color(0xffffffff);
  static const Color BLACK = Color(0xff141414);
  static const Color VIOLENT_START = Color(0xFF7472af);
  static const Color VIOLENT_END = Color(0xFF403e77);
  static const Color WHITE_70 = Colors.white70;
  static const Color BLACK_54 = Colors.black54;
  static const Color REAL_BLACK= Color(0xff000000);
}
class DarkThemeConfig {
  static const Color OLA_COLOR = Color(0xffbfd9cc);
  static const Color BLUE_GRANADE = Color(0xffd5d6b1);
  static const Color GRAY_DARK = Color(0xFFb2b1d6);
  static const Color PURPLE_ = Color.fromRGBO(137, 120, 172, 1.0);
  static const Color BLUE_GRAY = Color(0xffdbd4cb);
  static const Color MINT_GREEN = Color(0xffe22049);
  static const Color ST_TROPAZ = Color(0xff887052);
  static const Color BLUE_LIGHT_GRAY = Color(0xff8a8073);
  static const Color BLUE_CYAN = Color(0xff241c12);
  static const Color WHITE_SMOKE = Color(0xff212121);
  static const Color SNOW = Color(0xff050505);
  static const Color VENETIAN_RED = Color(0xffe6ac75);
  static const Color WHITE = Color(0xff444444);
  static const Color REAL_BLACK = Color(0xffffffff);
  static const Color BLACK = Color(0xffcfcfcf);
  static const Color VIOLENT_START = Color(0xFF8b8d50);
  static const Color VIOLENT_END = Color(0xFFbfc188);
  static const Color BLACK_54 = Colors.white70;
  static const Color WHITE_70 = Colors.black54;
}

class EnglishVer {
  static const String EMPTY = 'Nothing to show';
  static const String LAST_VISITED = 'Last Visited';
  static const String YOUR_LISTS = "Your lists";
  static const String RECIPES = 'Recipes';
  static const String STARRED = 'Saved';
  static const String HISTORY = 'History';
  static const String DESC_HISTORY = 'Last visited';
  static const String DESC_STARRED = 'Your fav recipes';

  static const String PROFILE = 'Profile';
  static const String DESCRIPTION = 'Description';
  static const String QUESTION_SURE = 'Are You sure?';
  static const String NO_INTERNET =
      'Something went wrong, please check your internet connection';
  static const String OK = 'OK';
  static const String YES = 'Yes';
  static const String NO = 'No';
  static const String SHOW_RECIPES = 'Show recipes';
  static const String HOME = 'Home';
  static const String SEARCH = 'Search';

  static const String FIRSTNAME = "Firstname";
  static const String LASTNAME = "Lastname";
  static const String PHONE_NO = "Phone number";
  static const String TIME_WITH_US = "You are here since";
  static const String COOKING_TIME = "Cooking time";
  static const String TODAY_S_RECIPES = "Today's recipes";

  static const String INGREDIENTS = "Ingredients";

}

class Lists{
  static const List<String> cuisines = ["all", "african", "chinese", "japanese", "korean", "vietnamese", "thai", "indian", "british", "irish", "french", "italian", "mexican", "spanish", "middle eastern", "jewish", "american", "cajun", "southern", "greek", "german", "nordic", "eastern european", "caribbean", "latin american"];
  static const List<String> diets = ["all", "pescetarian", "lacto", "vegetarian", "ovo vegetarian", "vegan", "vegetarian" ];
  static const List<String> types = ["all", "main course", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "drink"];
}
