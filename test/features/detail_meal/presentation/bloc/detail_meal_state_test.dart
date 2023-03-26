import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/network/api_service.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_bloc.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_state.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late DetailMealBloc detailMealBloc;

  setUp(() {
    apiService = MockApiService();
    detailMealBloc = DetailMealBloc(apiService: apiService);
  });

  group("CategoryState test", () {
    blocTest('emits [] when nothing is added',
        build: () => detailMealBloc, expect: () => []);

    test('Initial state for detailMealState is ResultData.initial()', () {
      expect(
          detailMealBloc.state.detailMealState.status,
          DetailMealState(detailMealState: ResultData.initial())
              .detailMealState
              .status);
    });
  });
}