import 'package:equatable/equatable.dart';

class MealEvent extends Equatable {

  const MealEvent();

  @override
  List<Object?> get props => [];
}

class GetMeal extends MealEvent {
  final String categoryMeal;

  const GetMeal({ required this.categoryMeal});
}