import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_event.dart';

void main() {
  group('CategoryEvent Test', () {
    group('GetCategory', () {
      test('supports value comparison', () {
        expect(GetCategory(), GetCategory());
      });
    });
  });
}