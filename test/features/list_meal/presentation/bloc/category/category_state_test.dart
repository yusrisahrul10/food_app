import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/network/api_service.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_state.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late CategoryBloc categoryBloc;

  setUp(() {
    apiService = MockApiService();
    categoryBloc = CategoryBloc(apiService: apiService);
  });

  group("CategoryState test", () {
    blocTest('emits [] when nothing is added',
        build: () => categoryBloc, expect: () => []);

    test('Initial state for categoryState is ResultData.initial()', () {
      expect(
          categoryBloc.state.categoryState.status,
          CategoryState(categoryState: ResultData.initial())
              .categoryState
              .status);
    });
  });
}
