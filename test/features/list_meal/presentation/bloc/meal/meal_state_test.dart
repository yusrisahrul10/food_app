import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/network/api_service.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_state.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late MealBloc mealBloc;

  setUp(() {
    apiService = MockApiService();
    mealBloc = MealBloc(apiService: apiService);
  });

  group("CategoryState test", () {
    blocTest('emits [] when nothing is added',
        build: () => mealBloc, expect: () => []);

    test('Initial state for mealState is ResultData.initial()', () {
      expect(
          mealBloc.state.mealState.status,
          MealState(mealState: ResultData.initial())
              .mealState
              .status);
    });
  });
}