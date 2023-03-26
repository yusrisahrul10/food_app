class DetailMealResponse {
  DetailMealResponse({
    required this.meals,
  });

  final List<Meal> meals;

  factory DetailMealResponse.fromJson(Map<String, dynamic> json) =>
      DetailMealResponse(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
  });

  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final dynamic strTags;
  final String strYoutube;
  final dynamic strIngredient1;
  final dynamic strIngredient2;
  final dynamic strIngredient3;
  final dynamic strIngredient4;
  final dynamic strIngredient5;
  final dynamic strIngredient6;
  final dynamic strIngredient7;
  final dynamic strIngredient8;
  final dynamic strIngredient9;
  final dynamic strIngredient10;
  final dynamic strIngredient11;
  final dynamic strIngredient12;
  final dynamic strIngredient13;
  final dynamic strIngredient14;
  final dynamic strIngredient15;
  final dynamic strIngredient16;
  final dynamic strIngredient17;
  final dynamic strIngredient18;
  final dynamic strIngredient19;
  final dynamic strIngredient20;
  final dynamic strMeasure1;
  final dynamic strMeasure2;
  final dynamic strMeasure3;
  final dynamic strMeasure4;
  final dynamic strMeasure5;
  final dynamic strMeasure6;
  final dynamic strMeasure7;
  final dynamic strMeasure8;
  final dynamic strMeasure9;
  final dynamic strMeasure10;
  final dynamic strMeasure11;
  final dynamic strMeasure12;
  final dynamic strMeasure13;
  final dynamic strMeasure14;
  final dynamic strMeasure15;
  final dynamic strMeasure16;
  final dynamic strMeasure17;
  final dynamic strMeasure18;
  final dynamic strMeasure19;
  final dynamic strMeasure20;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
      strCategory: json["strCategory"],
      strMeal: json["strMeal"],
      strArea: json["strArea"],
      strInstructions: json["strInstructions"],
      strMealThumb: json["strMealThumb"],
      strTags: json["strTags"],
      strYoutube: json["strYoutube"],
      strIngredient1: json["strIngredient1"],
      strIngredient2: json["strIngredient2"],
      strIngredient3: json["strIngredient3"],
      strIngredient4: json["strIngredient4"],
      strIngredient5: json["strIngredient5"],
      strIngredient6: json["strIngredient6"],
      strIngredient7: json["strIngredient7"],
      strIngredient8: json["strIngredient8"],
      strIngredient9: json["strIngredient9"],
      strIngredient10: json["strIngredient10"],
      strIngredient11: json["strIngredient11"],
      strIngredient12: json["strIngredient12"],
      strIngredient13: json["strIngredient13"],
      strIngredient14: json["strIngredient14"],
      strIngredient15: json["strIngredient15"],
      strIngredient16: json["strIngredient16"],
      strIngredient17: json["strIngredient17"],
      strIngredient18: json["strIngredient18"],
      strIngredient19: json["strIngredient19"],
      strIngredient20: json["strIngredient20"],
      strMeasure1: json["strMeasure1"],
      strMeasure2: json["strMeasure2"],
      strMeasure3: json["strMeasure3"],
      strMeasure4: json["strMeasure4"],
      strMeasure5: json["strMeasure5"],
      strMeasure6: json["strMeasure6"],
      strMeasure7: json["strMeasure7"],
      strMeasure8: json["strMeasure8"],
      strMeasure9: json["strMeasure9"],
      strMeasure10: json["strMeasure10"],
      strMeasure11: json["strMeasure11"],
      strMeasure12: json["strMeasure12"],
      strMeasure13: json["strMeasure13"],
      strMeasure14: json["strMeasure14"],
      strMeasure15: json["strMeasure15"],
      strMeasure16: json["strMeasure16"],
      strMeasure17: json["strMeasure17"],
      strMeasure18: json["strMeasure18"],
      strMeasure19: json["strMeasure19"],
      strMeasure20: json["strMeasure20"]);
}
