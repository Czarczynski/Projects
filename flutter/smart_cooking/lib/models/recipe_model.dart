class RecipeModel {
  List<RecipesModel> recipes, results;

  RecipeModel(this.recipes, this.results);

  RecipeModel.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = new List<RecipesModel>();
      json['recipes'].forEach((v) {
        recipes.add(new RecipesModel.fromJson(v));
      });
    }
    if (json['results'] != null) {
      results = new List<RecipesModel>();
      json['results'].forEach((v) {
        results.add(new RecipesModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
class RecipeaModel {



}

class RecipesModel {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  String sourceUrl;
  String spoonacularSourceUrl;
  int aggregateLikes;
  double spoonacularScore;
  double healthScore;
  String creditsText;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredients> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String image;
  String imageType;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  WinePairing winePairing;
  String instructions;
  List<AnalyzedInstructions> analyzedInstructions;
  int preparationMinutes;
  int cookingMinutes;

  RecipesModel(
      {this.vegetarian,
      this.vegan,
      this.glutenFree,
      this.dairyFree,
      this.veryHealthy,
      this.cheap,
      this.veryPopular,
      this.sustainable,
      this.weightWatcherSmartPoints,
      this.gaps,
      this.lowFodmap,
      this.sourceUrl,
      this.spoonacularSourceUrl,
      this.aggregateLikes,
      this.spoonacularScore,
      this.healthScore,
      this.creditsText,
      this.sourceName,
      this.pricePerServing,
      this.extendedIngredients,
      this.id,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.image,
      this.imageType,
      this.cuisines,
      this.dishTypes,
      this.diets,
      this.occasions,
      this.winePairing,
      this.instructions,
      this.analyzedInstructions,
      this.preparationMinutes,
      this.cookingMinutes});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    lowFodmap = json['lowFodmap'];
    sourceUrl = json['sourceUrl'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
    aggregateLikes = json['aggregateLikes'];
    spoonacularScore = json['spoonacularScore'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = List<ExtendedIngredients>();
      json['extendedIngredients'].forEach((v) {
        extendedIngredients.add(ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    image = json['image'];
    imageType = json['imageType'];
    cuisines = json['cuisines'] != null ? json['cuisines'].cast<String>() : null;
    dishTypes = json['dishTypes'] != null ? json['dishTypes'].cast<String>() : null;
    diets = json['diets'] != null ? json['diets'].cast<String>() : null;
    occasions = json['occasions'] != null ? json['occasions'].cast<String>() : null;
    winePairing = json['winePairing'] != null
        ? WinePairing.fromJson(json['winePairing'])
        : null;
    instructions = json['instructions'];
    if (json['analyzedInstructions'] != null) {
      analyzedInstructions = List<AnalyzedInstructions>();
      json['analyzedInstructions'].forEach((v) {
        analyzedInstructions.add(AnalyzedInstructions.fromJson(v));
      });
    }
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['vegetarian'] = this.vegetarian;
    data['vegan'] = this.vegan;
    data['glutenFree'] = this.glutenFree;
    data['dairyFree'] = this.dairyFree;
    data['veryHealthy'] = this.veryHealthy;
    data['cheap'] = this.cheap;
    data['veryPopular'] = this.veryPopular;
    data['sustainable'] = this.sustainable;
    data['weightWatcherSmartPoints'] = this.weightWatcherSmartPoints;
    data['gaps'] = this.gaps;
    data['lowFodmap'] = this.lowFodmap;
    data['sourceUrl'] = this.sourceUrl;
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
    data['aggregateLikes'] = this.aggregateLikes;
    data['spoonacularScore'] = this.spoonacularScore;
    data['healthScore'] = this.healthScore;
    data['creditsText'] = this.creditsText;
    data['sourceName'] = this.sourceName;
    data['pricePerServing'] = this.pricePerServing;
    if (this.extendedIngredients != null) {
      data['extendedIngredients'] =
          this.extendedIngredients.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['cuisines'] = this.cuisines;
    data['dishTypes'] = this.dishTypes;
    data['diets'] = this.diets;
    data['occasions'] = this.occasions;
    if (this.winePairing != null) {
      data['winePairing'] = this.winePairing.toJson();
    }
    data['instructions'] = this.instructions;
    if (this.analyzedInstructions != null) {
      data['analyzedInstructions'] =
          this.analyzedInstructions.map((v) => v.toJson()).toList();
    }
    data['preparationMinutes'] = this.preparationMinutes;
    data['cookingMinutes'] = this.cookingMinutes;
    return data;
  }
}

class ExtendedIngredients {
  bool haveIt;
  int id;
  String aisle;
  String image;
  String consitency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  List<String> metaInformation;
  Measures measures;

  ExtendedIngredients(
      {this.haveIt,
        this.id,
      this.aisle,
      this.image,
      this.consitency,
      this.name,
      this.original,
      this.originalString,
      this.originalName,
      this.amount,
      this.unit,
      this.meta,
      this.metaInformation,
      this.measures});

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    haveIt = false;
    id = json['id'];
    aisle = json['aisle'];
    image = json['image'];
    consitency = json['consitency'];
    name = json['name'];
    original = json['original'];
    originalString = json['originalString'];
    originalName = json['originalName'];
    amount = json['amount'];
    unit = json['unit'];
    meta = json['meta'] != null ? json['meta'].cast<String>() : null;
    metaInformation = json['metaInformation'] != null ? json['metaInformation'].cast<String>() : null;
    measures = json['measures'] != null
        ? Measures.fromJson(json['measures'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['aisle'] = this.aisle;
    data['image'] = this.image;
    data['consitency'] = this.consitency;
    data['name'] = this.name;
    data['original'] = this.original;
    data['originalString'] = this.originalString;
    data['originalName'] = this.originalName;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['meta'] = this.meta;
    data['metaInformation'] = this.metaInformation;
    if (this.measures != null) {
      data['measures'] = this.measures.toJson();
    }
    return data;
  }
}

class Measures {
  Us us;
  Us metric;

  Measures({this.us, this.metric});

  Measures.fromJson(Map<String, dynamic> json) {
    us = json['us'] != null ? Us.fromJson(json['us']) : null;
    metric = json['metric'] != null ? Us.fromJson(json['metric']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.us != null) {
      data['us'] = this.us.toJson();
    }
    if (this.metric != null) {
      data['metric'] = this.metric.toJson();
    }
    return data;
  }
}

class Us {
  double amount;
  String unitShort;
  String unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  Us.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['unitShort'] = this.unitShort;
    data['unitLong'] = this.unitLong;
    return data;
  }
}

class WinePairing {
  List<String> pairedWines;
  String pairingText;
  List<ProductMatches> productMatches;

  WinePairing({this.pairedWines, this.pairingText, this.productMatches});

  WinePairing.fromJson(Map<String, dynamic> json) {
    pairedWines = json['pairedWines'] != null ? json['pairedWines'].cast<String>() : null;
    pairingText = json['pairingText'];
    if (json['productMatches'] != null) {
      productMatches = List<ProductMatches>();
      json['productMatches'].forEach((v) {
        productMatches.add(new ProductMatches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pairedWines'] = this.pairedWines;
    data['pairingText'] = this.pairingText;
    if (this.productMatches != null) {
      data['productMatches'] =
          this.productMatches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductMatches {
  int id;
  String title;
  String description;
  String price;
  String imageUrl;
  double averageRating;
  double ratingCount;
  double score;
  String link;

  ProductMatches(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageUrl,
      this.averageRating,
      this.ratingCount,
      this.score,
      this.link});

  ProductMatches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    score = json['score'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['averageRating'] = this.averageRating;
    data['ratingCount'] = this.ratingCount;
    data['score'] = this.score;
    data['link'] = this.link;
    return data;
  }
}

class AnalyzedInstructions {
  String name;
  List<Steps> steps;

  AnalyzedInstructions({this.name, this.steps});

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = List<Steps>();
      json['steps'].forEach((v) {
        steps.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    if (this.steps != null) {
      data['steps'] = this.steps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int number;
  String step;
  List<Ingredients> ingredients;
  List<Equipment> equipment;
  Temperature length;

  Steps(
      {this.number, this.step, this.ingredients, this.equipment, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = List<Ingredients>();
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
    if (json['equipment'] != null) {
      equipment = List<Equipment>();
      json['equipment'].forEach((v) {
        equipment.add(new Equipment.fromJson(v));
      });
    }
    length = json['length'] != null
        ? Temperature.fromJson(json['length'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['step'] = this.step;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    if (this.equipment != null) {
      data['equipment'] = this.equipment.map((v) => v.toJson()).toList();
    }
    if (this.length != null) {
      data['length'] = this.length.toJson();
    }
    return data;
  }
}

class Ingredients {
  int id;
  String name;
  String image;

  Ingredients({this.id, this.name, this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Equipment {
  int id;
  String name;
  String image;
  Temperature temperature;

  Equipment({this.id, this.name, this.image, this.temperature});

  Equipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    temperature = json['temperature'] != null
        ? Temperature.fromJson(json['temperature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.temperature != null) {
      data['temperature'] = this.temperature.toJson();
    }
    return data;
  }
}

class Temperature {
  //int number;
  String unit;

//  Temperature({this.number, this.unit});
  Temperature({ this.unit});

  Temperature.fromJson(Map<String, dynamic> json) {
    //number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    //data['number'] = this.number;
    data['unit'] = this.unit;
    return data;
  }
}
