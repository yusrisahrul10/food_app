import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/network/api_service.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/list_meal/data/model/meal_response.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_event.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_state.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late MealBloc mealBloc;

  group('MealBloc Test', () {
    setUp(() {
      apiService = MockApiService();
      mealBloc = MealBloc(apiService: apiService);
    });

    group('GetMeal', () {
      blocTest<MealBloc, MealState>(
        'emits [ResultData.loading and ResultData.empty] when GetMeal is added',
        build: () {
          when(
                () => apiService.getListMealByCategory("Beef"),
          ).thenAnswer((_) async => MealResponse(meals: []));
          return mealBloc;
        },
        act: (MealBloc bloc) => bloc.add(const GetMeal(categoryMeal: "Beef")),
        expect: () => [
          MealState(
            mealState: ResultData.loading(message: 'Loading'),
          ),
          MealState(
            mealState: ResultData.empty(message: 'Kosong'),
          ),
        ],
      );
    });
  });
}