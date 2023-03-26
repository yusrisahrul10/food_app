import 'package:equatable/equatable.dart';
import 'package:food_app/features/list_meal/data/model/meal_response.dart';

import '../../../../../shared/utils/result_data.dart';

class MealState extends Equatable {
  final ResultData<MealResponse> mealState;

  const MealState({
    required this.mealState,
  });

  MealState copyWith({
    ResultData<MealResponse>? mealState,
  }) {
    return MealState(
      mealState: mealState ?? this.mealState,
    );
  }

  @override
  List<Object?> get props => [mealState];
}