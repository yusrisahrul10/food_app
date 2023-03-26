import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_event.dart';

void main() {
  group('MealEvent Test', () {
    group('GetMeal', () {
      test('supports value comparison', () {
        expect(const GetMeal(categoryMeal: 'Beef'), const GetMeal(categoryMeal: 'Beef'));
      });
    });
  });
}