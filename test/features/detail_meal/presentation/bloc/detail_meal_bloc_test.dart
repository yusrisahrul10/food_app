import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/network/api_service.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/detail_meal/data/model/detail_meal_response.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_bloc.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_event.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_state.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late DetailMealBloc detailMealBloc;

  group('DetailMealBloc Test', () {
    setUp(() {
      apiService = MockApiService();
      detailMealBloc = DetailMealBloc(apiService: apiService);
    });

    group('GetDetailMeal', () {
      blocTest<DetailMealBloc, DetailMealState>(
        'emits [ResultData.loading and ResultData.empty] when GetDetailMeal is added',
        build: () {
          when(
                () => apiService.getDetailMealById("53021"),
          ).thenAnswer((_) async => DetailMealResponse(meals: []));
          return detailMealBloc;
        },
          act: (DetailMealBloc bloc) => bloc.add(const GetDetailMeal(idMeal: "53021")),
        expect: () => [
          DetailMealState(
            detailMealState: ResultData.loading(message: 'Loading'),
          ),
          DetailMealState(
            detailMealState: ResultData.empty(message: 'Kosong'),
          ),
        ],
      );
    });
  });
}