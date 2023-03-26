class CategoryResponse {

  CategoryResponse({
    required this.meals,
  });

  final List<Meal> meals;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );
}

class Meal {
  Meal({
    required this.strCategory
  });

  final String strCategory;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
      strCategory: json["strCategory"]
  );
}