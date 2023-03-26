import 'package:bloc/bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_event.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_state.dart';

import '../../../../../core/network/api_service.dart';
import '../../../../../shared/utils/result_data.dart';

class MealBloc extends Bloc<MealEvent, MealState> {

  final ApiService apiService;
  MealBloc({
    required this.apiService,
  }) : super(
    MealState(
      mealState: ResultData.initial(),
    ),
  ) {
    on<GetMeal>(_getMealByCategory);
  }

  void _getMealByCategory(GetMeal event, Emitter<MealState> emit) async {
    try {
      emit(
        state.copyWith(mealState: ResultData.loading(message: 'Loading')),
      );
      final result = await apiService.getListMealByCategory(event.categoryMeal);
      if (result!.meals.isEmpty) {
        emit(state.copyWith(mealState: ResultData.empty(message: 'Kosong')));
      } else {
        emit(state.copyWith(mealState: ResultData.loaded(data: result)));
      }
    } catch (e) {
      emit(
        state.copyWith(mealState: ResultData.error(message: e.toString())),
      );
    }
  }

}