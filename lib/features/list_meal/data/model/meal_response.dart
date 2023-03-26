class MealResponse {
  MealResponse({
    required this.meals,
  });

  final List<Meal> meals;

  factory MealResponse.fromJson(Map<String, dynamic> json) =>
      MealResponse(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );
}
