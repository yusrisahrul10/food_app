import 'package:equatable/equatable.dart';
import 'package:food_app/features/detail_meal/data/model/detail_meal_response.dart';

import '../../../../shared/utils/result_data.dart';

class DetailMealState extends Equatable {
  final ResultData<DetailMealResponse> detailMealState;

  const DetailMealState({
    required this.detailMealState,
  });

  DetailMealState copyWith({
    ResultData<DetailMealResponse>? detailMealState,
  }) {
    return DetailMealState(
      detailMealState: detailMealState ?? this.detailMealState,
    );
  }

  @override
  List<Object?> get props => [detailMealState];
}