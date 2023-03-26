import 'package:bloc/bloc.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_state.dart';

import '../../../../core/network/api_service.dart';
import '../../../../shared/utils/result_data.dart';
import 'detail_meal_event.dart';


class DetailMealBloc extends Bloc<DetailMealEvent, DetailMealState> {

  final ApiService apiService;
  DetailMealBloc({
    required this.apiService,
  }) : super(
    DetailMealState(
      detailMealState: ResultData.initial(),
    ),
  ) {
    on<GetDetailMeal>(_getMealByCategory);
  }

  void _getMealByCategory(GetDetailMeal event, Emitter<DetailMealState> emit) async {
    try {
      emit(
        state.copyWith(detailMealState: ResultData.loading(message: 'Loading')),
      );
      final result = await apiService.getDetailMealById(event.idMeal);
      if (result!.meals.isEmpty) {
        emit(state.copyWith(detailMealState: ResultData.empty(message: 'Kosong')));
      } else {
        emit(state.copyWith(detailMealState: ResultData.loaded(data: result)));
      }
    } catch (e) {
      emit(
        state.copyWith(detailMealState: ResultData.error(message: e.toString())),
      );
    }
  }

}