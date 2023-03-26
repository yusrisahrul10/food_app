import 'package:bloc/bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_event.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_state.dart';

import '../../../../../core/network/api_service.dart';
import '../../../../../shared/utils/result_data.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final ApiService apiService;

  CategoryBloc({
    required this.apiService,
  }) : super(
    CategoryState(
      categoryState: ResultData.initial(),
    ),
  ) {
    on<GetCategory>(_getCategory);
  }

  void _getCategory(GetCategory event, Emitter<CategoryState> emit) async {
    try {
      emit(
        state.copyWith(categoryState: ResultData.loading(message: 'Loading')),
      );
      final result = await apiService.getListCategory();
      if (result!.meals.isEmpty) {
        emit(state.copyWith(categoryState: ResultData.empty(message: 'Kosong')));
      } else {
        emit(state.copyWith(categoryState: ResultData.loaded(data: result)));
      }
    } catch (e) {
      emit(
        state.copyWith(categoryState: ResultData.error(message: e.toString())),
      );
    }
  }

}