import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/network/api_service.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/list_meal/data/model/category_response.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_event.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_state.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late CategoryBloc categoryBloc;

  group('CategoryBloc Test', () {
    setUp(() {
      apiService = MockApiService();
      categoryBloc = CategoryBloc(apiService: apiService);
    });

    group('GetCategory', () {
      blocTest<CategoryBloc, CategoryState>(
        'emits [ResultData.loading and ResultData.empty] when GetCategory is added',
        build: () {
          when(
                () => apiService.getListCategory(),
          ).thenAnswer((_) async => CategoryResponse(meals: []));
          return categoryBloc;
        },
        act: (CategoryBloc bloc) => bloc.add(GetCategory()),
        expect: () => [
          CategoryState(
            categoryState: ResultData.loading(message: 'Loading'),
          ),
          CategoryState(
            categoryState: ResultData.empty(message: 'Kosong'),
          ),
        ],
      );
    });
  });
}