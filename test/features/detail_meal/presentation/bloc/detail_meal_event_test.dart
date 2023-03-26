import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_event.dart';

void main() {
  group('DetailMealEvent Test', () {
    group('GetMeal', () {
      test('supports value comparison', () {
        expect(const GetDetailMeal(idMeal: '53021'), const GetDetailMeal(idMeal: '53021'));
      });
    });
  });
}