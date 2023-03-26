import 'package:equatable/equatable.dart';
import 'package:food_app/features/list_meal/data/model/category_response.dart';

import '../../../../../shared/utils/result_data.dart';

class CategoryState extends Equatable {
  final ResultData<CategoryResponse> categoryState;

  const CategoryState({
    required this.categoryState,
  });

  CategoryState copyWith({
    ResultData<CategoryResponse>? categoryState,
  }) {
    return CategoryState(
      categoryState: categoryState ?? this.categoryState,
    );
  }

  @override
  List<Object?> get props => [categoryState];
}